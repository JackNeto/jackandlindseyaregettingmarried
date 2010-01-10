class UsersController < ApplicationController
  before_filter :require_user
  
  def dashboard
    # ...
  end
  
  def show
    render :action => 'dashboard'
  end
  
end
