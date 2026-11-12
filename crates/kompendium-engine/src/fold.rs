//! The text side of the contract: `normalise`, words and EA codes
//! (docs/engine/kompendium-engine-v1.md, "Normalisation"), on the tables of `tables.rs`.

use crate::tables::{
    CASED, CASE_IGNORABLE, FOLD_DATA, FOLD_KEYS, FOLD_OFFSETS, LOWER, LOWER_MULTI, MARK, WORD,
};

fn in_ranges(table: &[(u32, u32)], cp: u32) -> bool {
    table
        .binary_search_by(|&(a, b)| {
            if b < cp {
                core::cmp::Ordering::Less
            } else if a > cp {
                core::cmp::Ordering::Greater
            } else {
                core::cmp::Ordering::Equal
            }
        })
        .is_ok()
}

fn is_mark(c: char) -> bool {
    in_ranges(MARK, c as u32)
}

/// A character of a word: General_Category L* or N*.
pub fn is_word_char(c: char) -> bool {
    in_ranges(WORD, c as u32)
}

/// The contract's whitespace (JS `\s` plus U+0085).
fn is_space(c: char) -> bool {
    matches!(c as u32,
        0x09..=0x0d | 0x20 | 0x85 | 0xa0 | 0x1680 | 0x2000..=0x200a | 0x2028 | 0x2029 | 0x202f
        | 0x205f | 0x3000 | 0xfeff)
}

/// Steps 1 and 2: NFKD, then every combining mark dropped. Per code point, because every code
/// point with a nonzero combining class is a mark (so canonical reordering never shows).
fn fold_into(c: char, out: &mut Vec<char>) {
    let cp = c as u32;
    if (0xac00..=0xd7a3).contains(&cp) {
        // Hangul syllables decompose by rule (Unicode 3.12) into jamo, none of them marks.
        let s = cp - 0xac00;
        out.push(char::from_u32(0x1100 + s / 588).unwrap_or(c));
        out.push(char::from_u32(0x1161 + (s % 588) / 28).unwrap_or(c));
        if !s.is_multiple_of(28) {
            out.push(char::from_u32(0x11a7 + s % 28).unwrap_or(c));
        }
        return;
    }
    if let Ok(i) = FOLD_KEYS.binary_search(&cp) {
        let (a, b) = (FOLD_OFFSETS[i] as usize, FOLD_OFFSETS[i + 1] as usize);
        out.extend(FOLD_DATA[a..b].chars());
    } else if !is_mark(c) {
        out.push(c);
    }
}

fn lower_into(c: char, out: &mut String) {
    let cp = c as u32;
    if let Ok(i) = LOWER.binary_search_by_key(&cp, |&(k, _)| k) {
        out.push(char::from_u32(LOWER[i].1).unwrap_or(c));
    } else if let Some(&(_, s)) = LOWER_MULTI.iter().find(|&&(k, _)| k == cp) {
        out.push_str(s);
    } else {
        out.push(c);
    }
}

/// U+03A3 lowers to final U+03C2 after a cased letter (case-ignorable ones skipped) with no
/// cased letter after it, else to U+03C3: str.lower's and String.prototype.toLowerCase's rule.
fn sigma(text: &[char], i: usize) -> char {
    let cased = |c: char| in_ranges(CASED, c as u32);
    let ignorable = |c: char| in_ranges(CASE_IGNORABLE, c as u32);
    let before = text[..i].iter().rev().find(|&&c| !ignorable(c));
    let mut fin = matches!(before, Some(&c) if cased(c));
    if fin {
        let after = text[i + 1..].iter().find(|&&c| !ignorable(c));
        fin = !matches!(after, Some(&c) if cased(c));
    }
    if fin { '\u{3c2}' } else { '\u{3c3}' }
}

/// `normalise(s)`: NFKD, marks dropped, lower case, whitespace runs collapsed to one space and
/// the result trimmed of spaces.
pub fn normalise(text: &str) -> String {
    let mut bare = Vec::with_capacity(text.len());
    for c in text.chars() {
        fold_into(c, &mut bare);
    }
    let mut lower = String::with_capacity(bare.len());
    for (i, &c) in bare.iter().enumerate() {
        if c == '\u{3a3}' {
            lower.push(sigma(&bare, i));
        } else {
            lower_into(c, &mut lower);
        }
    }
    let mut out = String::with_capacity(lower.len());
    let mut in_space = false;
    for c in lower.chars() {
        if is_space(c) {
            if !in_space {
                out.push(' ');
            }
            in_space = true;
        } else {
            out.push(c);
            in_space = false;
        }
    }
    out.trim_matches(' ').to_string()
}

/// The words of a normalised string: maximal runs of letters and digits.
pub fn tokens(norm: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut word = String::new();
    for c in norm.chars() {
        if is_word_char(c) {
            word.push(c);
        } else if !word.is_empty() {
            out.push(core::mem::take(&mut word));
        }
    }
    if !word.is_empty() {
        out.push(word);
    }
    out
}

/// The canonical EA code ("EA-1.2.3") of a normalised string, or None. The grammar is
/// `^ea[ -]?([0-9]+)(?:[.-]([0-9]+|[a-z]))?(?:[.-]([0-9]+|[a-z]))?$`, parsed by hand: its
/// separators make it deterministic, so no backtracking is needed.
pub fn ea_code(norm: &str) -> Option<String> {
    let s = norm.as_bytes();
    if !s.starts_with(b"ea") {
        return None;
    }
    let mut i = 2;
    if i < s.len() && (s[i] == b' ' || s[i] == b'-') {
        i += 1;
    }
    let digits = |i: usize| s[i..].iter().take_while(|b| b.is_ascii_digit()).count();
    let number = |part: &[u8]| {
        let t = part.iter().position(|&b| b != b'0').map_or(&part[part.len() - 1..], |z| &part[z..]);
        String::from_utf8_lossy(t).into_owned()
    };
    let n = digits(i);
    if n == 0 {
        return None;
    }
    let mut parts = vec![number(&s[i..i + n])];
    i += n;
    for _ in 0..2 {
        if i == s.len() {
            break;
        }
        if s[i] != b'.' && s[i] != b'-' {
            return None;
        }
        i += 1;
        let n = if i < s.len() { digits(i) } else { 0 };
        if n > 0 {
            parts.push(number(&s[i..i + n]));
            i += n;
        } else if i < s.len() && s[i].is_ascii_lowercase() {
            parts.push((s[i].to_ascii_uppercase() as char).to_string());
            i += 1;
        } else {
            return None;
        }
    }
    if i != s.len() {
        return None;
    }
    Some(format!("EA-{}", parts.join(".")))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn examples_of_the_contract() {
        assert_eq!(normalise("Šikana  "), "sikana");
        assert_eq!(normalise("Rychlá karta"), "rychla karta");
        assert_eq!(normalise("\u{fb01}"), "fi");
        assert_eq!(normalise("\u{3a3}\u{3a3}"), "\u{3c3}\u{3c2}");
        assert_eq!(normalise("\u{130}"), "i");
        assert_eq!(tokens("ea-1.2.3"), ["ea", "1", "2", "3"]);
        assert!(tokens("\u{2207}\u{221e}").is_empty());
        for q in ["ea-1.2.3", "ea 1.2.3", "ea1.2.3", "ea-1-2-3"] {
            assert_eq!(ea_code(q).as_deref(), Some("EA-1.2.3"));
        }
        assert_eq!(ea_code("ea-3.2.f").as_deref(), Some("EA-3.2.F"));
        assert_eq!(ea_code("ea1.02.3").as_deref(), Some("EA-1.2.3"));
        assert_eq!(ea_code("ea-007").as_deref(), Some("EA-7"));
        assert_eq!(ea_code("ea-000").as_deref(), Some("EA-0"));
        for q in ["1.2.3", "ea", "ea-", "ea--1", "ea-1.ab", "ea-1.2.3.4", "ea-1.", "ea-1 2"] {
            assert_eq!(ea_code(q), None, "{q}");
        }
    }
}
