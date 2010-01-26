class SessionsController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :new, :create]
  before_filter :redirect_if_logged_in, :only => [:index, :new, :create]
  
  
  def new
    @user = User.new
  end

  def create
    if @user = authenticate_and_login(params[:user][:email], params[:user][:password], params[:user][:remember_me])
      @user.update_attributes(:login_count => @user.login_count.to_i + 1, :last_request_at => Time.now)
      flash[:notice] = "Welcome #{@user.first_name}"
      redirect_or_default_to(dashboard_path)
    else
      if (@user = User.find_by_email(params[:user][:email]) ) && @user.password_match?(params[:user][:password]) && !@user.is_verified?
        flash[:error] = "Login failed. Please verify your account first."
      else
        flash[:error] = 'Login failed. Did you mistype?'
      end
      @user.update_attributes(:failed_login_count => @user.failed_login_count.to_i + 1, :last_request_at => Time.now)
      redirect_to login_path
    end
  end
  
  def destroy
    logout
    redirect_to home_path 
  end
  
private
  def redirect_if_logged_in
    redirect_to dashboard_path if logged_in?
  end
end
