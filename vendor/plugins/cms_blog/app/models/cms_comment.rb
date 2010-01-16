class CmsComment < ActiveRecord::Base
  
  # -- Relationships --------------------------------------------------------
  
  belongs_to :cms_post
  
  # -- Validations ----------------------------------------------------------
  
  validates_presence_of   :content
  
  # -- Scopes ----------------------------------------------------------

  named_scope :approved, :conditions => {:is_approved => true }
  
  # -- AR Callbacks ---------------------------------------------------------
  
  after_save :update_approved_comments_counter, :update_comments_counter
  after_destroy :update_approved_comments_counter, :update_comments_counter
  
  # -- Instance Methods --------------------------------------------------------
  
  def approve
    update_attribute(:is_approved, true)
  end
  
  def unapprove
    update_attribute(:is_approved, false)
  end
  
  
protected
  def update_approved_comments_counter
    self.connection.execute("UPDATE cms_posts SET cms_approved_comments_count = #{cms_post.cms_comments.approved.count} WHERE id = #{cms_post.id}")
  end

  def update_comments_counter
    self.connection.execute("UPDATE cms_posts SET cms_comments_count = #{cms_post.cms_comments.count} WHERE id = #{cms_post.id}")
  end
end
