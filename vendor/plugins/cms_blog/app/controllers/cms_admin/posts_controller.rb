class CmsAdmin::PostsController < CmsAdmin::BaseController
 
  before_filter :load_post, :only => [:edit, :update, :destroy]

  def index
    @posts = CmsPost.paginate :order => 'created_at DESC', :page => params[:page]
  end

  def new
    # ...
  end

  def edit
    # ...
  end

  def create
    @post = CmsPost.new(params[:post])
    @post.save!

    flash[:notice] = 'Post created'
    redirect_to :action => :edit, :id => @post

  rescue ActiveRecord::RecordInvalid
    render :action => :new
  end

  def update
    @post.update_attributes!(params[:post])

    flash[:notice] = 'Post updated'
    redirect_to :action => :edit, :id => @post

  rescue ActiveRecord::RecordInvalid
    render :action => :edit
  end

  def destroy
    @post.destroy

    flash[:notice] = 'Post removed'
    redirect_to :action => :index
  end

protected

  def load_post
    @post = CmsPost.find_by_id(params[:id])
  end
end