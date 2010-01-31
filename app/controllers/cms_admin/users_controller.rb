class CmsAdmin::UsersController < CmsAdmin::BaseController
 
  before_filter :load_user, :only => [:edit, :update, :destroy, :delete_avatar]
  before_filter :build_user, :only => [:new, :create]
  before_filter :collect_users, :only => [:send_message, :deliver_message, :preview_message]
  
  
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
    @user.add_friendships(params[:friends]) unless params[:friends].blank?
    flash[:notice] = 'User created'
    redirect_to :action => :index

  rescue ActiveRecord::RecordInvalid
    render :action => :new
  end

  def update
    @user.update_attributes!(params[:user])
    @user.add_friendships(params[:friends]) unless params[:friends].blank?
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
  
  def send_message
    # ...
  end

  def deliver_message
    if @users.blank?
      flash[:error] = 'Please select at least one user'
      return render :action => :send_message
    end
    UserNotifier.deliver_new_message(@users, params[:message][:subject], params[:message][:content])
    flash[:notice] = "Your message '#{params[:message][:subject]}' has been sent"
    redirect_to :action => :index
  end

  def preview_message
    @content = params[:message][:content]
    @subject = params[:message][:subject]
    unless @users.empty?
      @subject.gsub!(/\{\{([^}]*)\}\}/) { @users.first.send($1) } 
      @content.gsub!(/\{\{([^}]*)\}\}/) { @users.first.send($1) } 
    end
    render :layout => false
  end
  
protected

  def build_user
    @user = User.new(params[:user])
  end

  def load_user
    @user = User.find_by_id(params[:id])
  end
  
  def collect_users
    redirect_to cms_admin_users_path unless (params[:message] && params[:message][:users])
    @users = []
    params[:message][:users].each do |user_id, send|
      if (user = User.find(user_id)) && send == '1'
        @users << user
      end
    end
  end
end