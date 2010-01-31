class UsersController < ApplicationController
  before_filter :login_required
  before_filter :redirect_if_logged_in, :only => [:create, :verify_email, :change_password]
  before_filter :load_user, :only => [:edit, :update, :delete_avatar]
  
  def dashboard
    # ...
  end
  
  def show
    render :action => 'dashboard'
  end
  
  def edit
    # ...
  end
  
  def update
    @user.update_attributes!(params[:user])
    flash[:notice] = 'User updated'
    redirect_to :action => :dashboard

  rescue ActiveRecord::RecordInvalid
    render :action => :edit
  end
  
  
  def change_password
    if @user = User.find_by_email_validation_key(params[:email_validation_key])
      if request.get?
        if @user.is_verified?
          flash.now[:notice] = 'Your password has already been set. Now you can login.'
          redirect_to login_path
        end
      else request.put?
        if @user.update_attributes(params[:user].merge(
          :validated_at         => Time.now.to_s(:db),
          :email_validation_key => nil,
          :is_stub              => false,
          :login_count          => 1,
          :last_request_at      => Time.now
        ))
        
          login_as_user(@user)
          flash[:notice] = 'Thank you. Your password has been set.'
          UserNotifier.deliver_user_registered(@user)
          redirect_to dashboard_path
        else
          # ...
        end
      end
    else
      redirect_to login_path
    end
  end
  
  def delete_avatar
    @user.avatar = nil
    @user.save
    flash[:notice] = 'Photo deleted'
    redirect_to :action => :edit, :id => @user.id
  end
  

protected

  def redirect_if_logged_in
    redirect_to home_path if logged_in?
  end

  def load_user
    @user = User.find_by_id(params[:id])
    unless @user == session_user || session_user.friends.include?(@user)
      flash[:error] = "Sorry, you can't edit this user"
      redirect_to dashboard_path
    end
  end

end
