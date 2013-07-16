require "bundler/capistrano"
load 'deploy/assets'

load 'config/recipes/all'

server "198.211.122.4", :web, :app, :db, primary: true

set :application, "rgweb"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:ricardogomez/rgweb.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# nginx stuff
set :server_names, 'ricardogomez.com ricardogomez.org'
set :nginx_page_caching, false

# newrelic settings
set :newrelic_license_key, '0a0d3776322392d64886579d8e72499290edd79a'

# config files settings
set :config_files, ['database.yml', 'newrelic.yml']

# postgres download
set :host, 'ricardogomez.org'

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :custom do
  task :archive_symlink, roles: :app do
    run "ln -sf #{shared_path}/system/attachments #{release_path}/public/attachments"
  end
  after "deploy:finalize_update", "custom:archive_symlink"
end
