class CommentsController < ApplicationController

  before_filter :check_spambot, :only => :create
  before_filter :load_post
  before_filter :build_comment, :only => [:create]


  def create
    if @comment.save
      flash[:notice] = 'Your comment was submitted. Thank you.'
    else
      flash[:error] = 'There was a problem creating your comment.'
    end
    redirect_to post_path(@post)
  end

protected

  def build_comment
    @comment = @post.cms_comments.new(params[:cms_comment].merge(:is_approved => true))
  end
  
  def load_post
    @post = CmsPost.find_by_id(params[:post_id])
  end

  def check_spambot
    redirect_to home_path unless params[:zip_code].blank?
  end
end
