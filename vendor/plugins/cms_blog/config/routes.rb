ActionController::Routing::Routes.draw do |map|
  
  map.namespace :cms_admin, :path_prefix => 'cms-admin' do |cms_admin|
    cms_admin.resources :posts
  end
  
end
