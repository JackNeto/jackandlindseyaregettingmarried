ActionController::Routing::Routes.draw do |map|

  map.resource :user_session

  map.home  '/',  
    :controller => 'content', 
    :action     => 'index',
    :conditions => { :method => :get }

  map.login  '/login',  
    :controller => 'user_sessions', 
    :action     => 'new',
    :conditions => { :method => :get }

  map.logout  '/logout',  
    :controller => 'user_sessions', 
    :action     => 'destroy',
    :conditions => { :method => :delete }

  map.dashboard  '/dashboard',  
    :controller => 'users', 
    :action     => 'dashboard',
    :conditions => { :method => :get }

  map.with_options :controller => 'content', :conditions => {:method => :get} do |content|
    content.our_family '/our-family', :action => 'our_family'
  end
  
  map.namespace :cms_admin, :path_prefix => 'cms-admin' do |cms_admin|
    cms_admin.resources :users, :member => {:delete_avatar => :delete}
  end
  
  
end
