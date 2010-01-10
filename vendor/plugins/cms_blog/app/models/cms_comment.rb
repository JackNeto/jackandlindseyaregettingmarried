class CmsComment < ActiveRecord::Base
  
  # -- Relationships --------------------------------------------------------
  
  belongs_to :cms_post
  
  # -- Validations ----------------------------------------------------------
  
  validates_presence_of   :content
  validates_uniqueness_of :name
  
  # -- Scopes ----------------------------------------------------------
  
  # -- Class Methods --------------------------------------------------------
  
  
end
