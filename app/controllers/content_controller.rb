class ContentController < ApplicationController
  def index
    @posts = CmsPost.published.all(:order => 'created_at DESC')
  end
  
  %w{family-and-guests bridal-party our-parents}.each do |page_slug|
    define_method(page_slug.underscore.to_sym) {
      @users = User.all(:conditions => {:show_in => page_slug}, :order => :position)
      @cms_page = CmsPage.find_by_slug(page_slug)
      render 'family_page'
    }
  end

end
