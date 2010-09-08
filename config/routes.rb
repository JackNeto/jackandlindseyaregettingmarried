ActionController::Routing::Routes.draw do |map|

  map.resource :sessions
  map.resources :users, 
    :member => {
      :delete_avatar      => :delete
    }
  
  map.with_options :controller => 'users' do |user|
    user.change_password '/change-password/:email_validation_key',
      :action     => 'change_password'
  end


  map.home  '/',  
    :controller => 'content', 
    :action     => 'index',
    :conditions => { :method => :get }

  map.login  '/login',  
    :controller => 'sessions', 
    :action     => 'new',
    :conditions => { :method => :get }

  map.logout  '/logout',  
    :controller => 'sessions',
    :action     => 'destroy',
    :conditions => { :method => :delete }

  map.dashboard  '/dashboard',  
    :controller => 'users', 
    :action     => 'dashboard',
    :conditions => { :method => :get }

  map.resources :posts do |post|
    post.resources :comments
  end
  
  map.with_options :controller => 'content', :conditions => {:method => :get} do |content|
    content.our_parents       '/our-parents',       :action => 'our_parents'
    content.bridal_party      '/bridal-party',      :action => 'bridal_party'
    content.family_and_guests '/family-and-guests', :action => 'family_and_guests'
    content.photos            '/photos',            :action => 'photos'
  end
  
  map.namespace :cms_admin, :path_prefix => 'cms-admin' do |cms_admin|
    cms_admin.resources :users, 
      :member => {:delete_avatar => :delete}, 
      :collection => {
        :send_message => :post,
        :deliver_message => :post,
        :preview_message => :post
      } 
  end
  
  
end
