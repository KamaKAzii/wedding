root = "/home/deployer/apps/wedding/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.wedding.pid"
stderr_path "#{root}/log/unicorn.wedding.log"
stdout_path "#{root}/log/unicorn.wedding.log"

listen "/tmp/unicorn.wedding.sock"
worker_processes 2
timeout 30
