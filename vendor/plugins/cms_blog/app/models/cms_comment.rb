class CmsComment < ActiveRecord::Base
  
  # -- Relationships --------------------------------------------------------
  
  belongs_to :cms_post, :counter_cache => true
  
  # -- Validations ----------------------------------------------------------
  
  validates_presence_of   :content
  
  # -- Scopes ----------------------------------------------------------

  named_scope :approved, :conditions => {:is_approved => true }
  
  # -- instance Methods --------------------------------------------------------
  
  def approve
    update_attribute(:is_approved, true)
  end
  
  def unapprove
    update_attribute(:is_approved, false)
  end
  
end
