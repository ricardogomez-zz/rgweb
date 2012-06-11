root = "/home/deployer/apps/rgweb/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.rgweb.sock"
worker_processes 1
timeout 30
