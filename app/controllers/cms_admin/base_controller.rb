class CmsAdmin::BaseController < ApplicationController

  before_filter :login_required
  before_filter :is_admin?

  layout 'cms_admin'

protected

  def is_admin?
    if (logged_in? && session_user.is_admin?)
      return true
    else
      respond_with_403
    end
  end
  
end
