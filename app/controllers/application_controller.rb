class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :logged_in?
  
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

  # -- Authlogic Helper Methods ---------------------------------------------
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def logged_in?
    !current_user.blank?
  end

  def require_admin
    unless current_user && current_user.is_admin?
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  
  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to dashboard_path
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  
end
