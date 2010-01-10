default_run_options[:pty] = true


set :application, "wgtg-subscription"

set :scm, :git
set :repository,  "git@twg.unfuddle.com:twg/#{application}.git"
set :deploy_via,  :remote_cache

set :user, "deploy"
set :use_sudo, false
set :keep_releases, 2

set :app_symlinks,  %w{ }



task :staging do
  set :rails_env, 'staging'
  set :domain, "staging.theworkinggroup.ca"
  set :deploy_to, "/web/#{application}.theworkinggroup.ca"
  set :branch, "master"
  set :keep_releases, 1
  
  role :app, domain
  role :web, domain  
  role :db,   domain, :primary => true
end



task :production do
  set :rails_env, 'production'
  set :domain, "rails.theworkinggroup.ca"
  set :deploy_to, "/web/charities.wegivetoget.com"
  set :branch, "master"
  role :app, domain
  role :web, domain  
  role :db,   domain, :primary => true
  after "deploy:symlink", "deploy:update_crontab"
end

namespace :deploy do
  task :restart, :roles => :app do
    run "touch #{release_path}/tmp/restart.txt"
  end
  
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
  
end
