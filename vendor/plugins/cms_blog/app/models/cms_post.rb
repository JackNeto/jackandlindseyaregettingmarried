class CmsPost < ActiveRecord::Base
  
  # -- Relationships --------------------------------------------------------
  
  has_many :cms_comments, :dependent => :destroy
  
  # -- Validations ----------------------------------------------------------
  
  validates_presence_of   :content
  validates_uniqueness_of :title
  
  # -- Scopes ----------------------------------------------------------

  named_scope :published, :conditions => {:is_published => true }
  
  # -- AR Callbacks ---------------------------------------------------------
  
  after_save :notify_users
  
  # -- Instance Methods --------------------------------------------------------
  
  def to_param
    "#{self.id}-#{title.slugify}"
  end
  
protected
  def notify_users
    if self.is_published_changed? && self.is_published?
      CmsPostNotifier::deliver_new_post(self)
    end
  end
end
