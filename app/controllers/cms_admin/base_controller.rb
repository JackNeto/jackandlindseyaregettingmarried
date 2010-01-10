class CmsAdmin::BaseController < ApplicationController
  before_filter :require_admin
  layout 'cms_admin'

  
  def manage_session_array(name, action, value)
    session[name] = case action
    when :add
      (session[name] || []) + [value]
    when :remove
      (session[name] || []) - [value]
    end
  end
  
end
