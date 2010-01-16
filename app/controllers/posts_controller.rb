class PostsController < ApplicationController
 
  before_filter :load_post,     :only => [:show]
  before_filter :build_comment, :only => [:show]
  
  def index
    @posts = CmsPost.published.all(:order => 'created_at DESC')
  end
  
  def show
    store_location
  end

protected

  def load_post
    @post = CmsPost.find_by_id(params[:id])
  end

  def build_comment
    @comment = @post.cms_comments.new(params[:comments])
  end
end