class CmsAdmin::UsersController < CmsAdmin::BaseController
 
  before_filter :load_user, :only => [:edit, :update, :destroy, :delete_avatar]
  before_filter :build_user, :only => [:new, :create]

  def index
    @users = User.paginate :order => 'position, first_name, last_name', :page => params[:page]
  end

  def new
    @user.is_stub = true
    @user.show_in_family_page = true
  end

  def edit
    # ...
  end

  def create
    @user.email_validation_key  = Wristband::Support.random_salt.gsub(/[^A-Za-z0-9]/,'')
    @user.save!
    @user.update_attribute(:position, @user.id) if @user.position.blank?
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

  def build_user
    @user = User.new(params[:user])
  end

  def load_user
    @user = User.find_by_id(params[:id])
  end
end