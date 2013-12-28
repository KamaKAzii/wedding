require "bundler/capistrano"
require "rvm/capistrano"

set :application, "wedding"
set :repository,  "git@github.com:KamaKAzii/wedding.git"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :rvm_type, :user
set :rvm_ruby_string, "ruby-1.9.3-p448"
set :use_sudo, false
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }
set :normalize_asset_timestamps, false

role :web, "106.187.48.62"
role :app, "106.187.48.62"
role :db,  "106.187.48.62", :primary => true

default_run_options[:pty] = true

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "#{sudo} /etc/init.d/unicorn_#{application} #{command}"
      run "#{sudo} service nginx restart"
    end
  end

  task :setup_config, roles: :app do
    run "#{sudo} ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    run "#{sudo} service nginx restart"
    run "#{sudo} ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
  end

  task :custom_symlinks, roles: :app do
    sudo "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :everything, roles: :app do
    deploy.update
    deploy.restart
  end

end

before "deploy:assets:precompile", "deploy:setup_config"
after "deploy:setup_config", "deploy:custom_symlinks"
after "deploy:restart", "deploy:cleanup"

