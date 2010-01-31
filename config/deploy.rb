default_run_options[:pty] = true

set :application, 'jackandlindseyaregettingmarried'

set :scm,         :git
set :repository,  'git://github.com/JackNeto/jackandlindseyaregettingmarried.git'
set :deploy_via,  :remote_cache

set :user,      'deploy'
set :use_sudo,  false

set :keep_releases, 1

task :production do
  set :rails_env,   'production'
  set :domain,      "rails.twg.ca"
  set :deploy_to,   "/web/#{application}"
  set :branch,      'master'
  
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
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  
  namespace :asset do
    desc "symlink shared assets"
    task :symlink, :roles => :app, :except => { :no_release => true } do
      %w( avatars files).each { |dir| run("ln -sf #{shared_path}/public/#{dir} #{release_path}/public/#{dir}")}
    end
  end
  
end

after 'deploy:update_code', 'deploy:apply_configs'
after "deploy:update_code", "deploy:asset:symlink"
after 'deploy', 'deploy:cleanup'


Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
