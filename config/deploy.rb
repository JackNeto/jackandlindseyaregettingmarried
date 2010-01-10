default_run_options[:pty] = true

set :application, 'jackandlindseyaregettingmarried'

set :scm,         :git
set :repository,  'git@github.com:JackNeto/jackandlindseyaregettingmarried.git'
set :deploy_via,  :remote_cache

set :user,      'deploy'
set :use_sudo,  false

set :keep_releases, 3

task :production do
  set :rails_env,   'production'
  set :domain,      "#{application}.ca"
  set :deploy_to,   "/web/#{application}"
  set :branch,      'deploy'
  
  role :app,  domain
  role :web,  domain
  role :db,   domain, :primary => true
end


namespace :deploy do
  
  task :start do ; end
  task :stop  do ; end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{release_path}/tmp/restart.txt"
  end
  
  task :apply_configs, :roles => :app do
    run "cp #{release_path}/config/environments/#{rails_env}/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:apply_configs'
after 'deploy', 'deploy:cleanup'
