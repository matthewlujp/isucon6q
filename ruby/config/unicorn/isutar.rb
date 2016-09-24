worker_processes 5
preload_app true
timeout 120

# Listen to unix domain socket
listen "/tmp/unicorn_isutar.sock"

# Logging
stdout_path "../log/unicorn/isutar.stdout.log"
stderr_path "../log/unicorn/isutar.stderr.log"
