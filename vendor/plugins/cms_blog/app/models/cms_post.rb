class CmsPost < ActiveRecord::Base
  
  # -- Relationships --------------------------------------------------------
  
  has_many :cms_comments, :dependent => :destroy
  
  # -- Validations ----------------------------------------------------------
  
  validates_presence_of   :content
  validates_uniqueness_of :title
  
  # -- Scopes ----------------------------------------------------------

  named_scope :published, :conditions => {:is_published => true }
  
  
  # -- Class Methods --------------------------------------------------------
  
  
end
