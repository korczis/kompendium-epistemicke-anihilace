# 🚀 BUILD ACCELERATION: Optimized parallel test execution
ExUnit.start(
  # Enable maximum parallelism - utilize all CPU cores
  max_cases: System.schedulers_online() * 2,
  # Optimize for large test suites
  timeout: 60_000,
  # Better test reporting
  formatters: [ExUnit.CLIFormatter],
  # Capture logs for debugging
  capture_log: true
)
