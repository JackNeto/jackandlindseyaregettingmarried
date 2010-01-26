class UsersController < ApplicationController
  before_filter :login_required
  before_filter :redirect_if_logged_in, :only => [:create, :verify_email]
  
  def dashboard
    # ...
  end
  
  def show
    render :action => 'dashboard'
  end
  
protected
  def redirect_if_logged_in
    redirect_to home_path if logged_in?
  end
end
