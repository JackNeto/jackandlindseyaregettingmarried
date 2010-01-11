class ContentController < ApplicationController
  def index
    @posts = CmsPost.published.all(:order => 'created_at DESC')
  end
  
  def family_and_guests
    
  end
end
