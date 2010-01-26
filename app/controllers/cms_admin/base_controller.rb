class CmsAdmin::BaseController < ApplicationController

  before_filter :login_required
  before_filter :is_admin?

  layout 'cms_admin'
  
  def manage_session_array(name, action, value)
    session[name] = case action
    when :add
      (session[name] || []) + [value]
    when :remove
      (session[name] || []) - [value]
    end
  end

protected

  def is_admin?
    if (logged_in? && session_user.is_admin?)
      return true
    else
      respond_with_403
    end
  end
  
end
