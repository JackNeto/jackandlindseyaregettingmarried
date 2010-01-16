class CmsAdmin::CommentsController < CmsAdmin::BaseController

  before_filter :load_comment, :only => [:show, :edit, :update, :destroy, :approve, :unapprove]

  def index
    @comments = CmsComment.paginate :order => 'created_at DESC', :page => params[:page]
  end

  def show
    # ...
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
    
    respond_to do |format|
      format.js do
        @comment.update_attributes(params[:comment])
      end
      format.html do
        if @comment.update_attributes(params[:comment])
          flash[:notice] = 'Comment updated'
          redirect_to :action => :edit, :id => @comment
        else
          render :action => :edit
        end
      end
    end
  end

  def destroy
    @comment.destroy

    flash[:notice] = 'Comment removed'
    redirect_to :action => :index
  end

  def approve
    @comment.approve
  end

  def unapprove
    @comment.unapprove
  end

protected


  def load_comment
    @comment = CmsComment.find(params[:id])
  end
end