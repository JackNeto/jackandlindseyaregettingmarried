class CmsAdmin::BaseController < ApplicationController
  before_filter :require_admin
  layout 'cms_admin'
  
end
