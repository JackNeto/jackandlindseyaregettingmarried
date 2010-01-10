class ContentController < ApplicationController
  def index
    @posts = CmsPost.published.all(:order => 'created_at DESC')
  end
  
  def our_family
    
  end
end
