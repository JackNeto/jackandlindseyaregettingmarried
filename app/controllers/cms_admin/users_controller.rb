class CmsAdmin::UsersController < CmsAdmin::BaseController
 
  before_filter :load_user, :only => [:edit, :update, :destroy, :delete_avatar]

  def index
    @users = User.paginate :order => 'first_name, last_name', :page => params[:page]
  end

  def new
    # ...
  end

  def edit
    # ...
  end

  def create
    @user = User.new(params[:user])
    @user.save!

    flash[:notice] = 'User created'
    redirect_to :action => :index

  rescue ActiveRecord::RecordInvalid
    render :action => :new
  end

  def update
    @user.update_attributes!(params[:user])

    flash[:notice] = 'User updated'
    redirect_to :action => :index

  rescue ActiveRecord::RecordInvalid
    render :action => :edit
  end

  def destroy
    @user.destroy

    flash[:notice] = 'Post removed'
    redirect_to :action => :index
  end

  def delete_avatar
    @user.avatar = nil
    @user.save
    flash[:notice] = 'Photo deleted'
    redirect_to :action => :edit, :id => @user.id
  end
  
protected

  def load_user
    @user = User.find_by_id(params[:id])
  end
end