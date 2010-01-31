class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :login_from_cookie
  # before_filter :login_required
  before_filter :set_time_zone
  
protected
  
  helper_method :page_title,
                :header_title
                
  attr_accessor :page_title,
                :header_title
  
  def header_title
    ['Jack and Lindsey are getting married', (@header_title || page_title)].compact.join(' - ')
  end
  
  def header_title=(value)
    @header_title = value
  end
  
  def render_not_found(options = { })
    render({
      :partial => 'not_found',
      :layout => 'application',
      :status => 404
    }.merge(options))
    
    false
  end

  def delegate_render(method)
    send(method.to_sym)
    render(:action => method.to_s)
  end


  # -- Redirect helpers -------------------------------------------------
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_or_default_to(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  # -- Time Zone Management -------------------------------------------------

  def set_time_zone
    # FUTURE: Set based on user local settings
    Time.zone = 'Eastern Time (US & Canada)'
  end
  
  def respond_not_logged_in
    flash[:error] = "Sorry, you don't have permission to access this area."
    redirect_to logged_in? ? home_path : login_path
  end
end
