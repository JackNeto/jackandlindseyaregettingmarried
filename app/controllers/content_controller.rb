class ContentController < ApplicationController
  def index
    @posts = CmsPost.published.all(:order => 'created_at DESC')
  end
  
  def family_and_guests
    @users = User.all(:conditions => {:show_in_family_page => true}, :order => :position)
    @cms_page = CmsPage.find_by_slug('family-and-guests')
  end
end
