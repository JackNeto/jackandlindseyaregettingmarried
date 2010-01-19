class CmsPost < ActiveRecord::Base
  
  # -- Relationships --------------------------------------------------------
  
  has_many :cms_comments, :dependent => :destroy
  
  # -- Validations ----------------------------------------------------------
  
  validates_presence_of   :content
  validates_uniqueness_of :title
  
  # -- Scopes ----------------------------------------------------------

  named_scope :published, :conditions => {:is_published => true }
  
  
  # -- Instance Methods --------------------------------------------------------
  
  def to_param
    "#{self.id}-#{title.slugify}"
  end
  
  
end
