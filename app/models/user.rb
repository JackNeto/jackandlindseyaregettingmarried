class User < ActiveRecord::Base
  
  # >> AR Extensions --------------------------------------------------------
  
  acts_as_authentic
  has_attached_file :avatar,
                    :styles => { 
                      :original => "100x100>", 
                      :thumb => "50x50>" 
                    }
  
  # >> Validations ----------------------------------------------------------

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_length_of :email,
    :in         => 6..100,
    :too_short  => 'Your email address needs to be at least 6 characters long.'
  validates_format_of :email,
    :message    => 'The email you entered is not valid.',
    :with       => RFC822::EmailAddress
  
  # >> Instance methods ----------------------------------------------------------
  
  def email_is_validated?
    !self.validated_at.blank?
  end

  def validate_email!
    self.validated_at = Time.now
    self.save!
  end

  def is_admin?
    self.role == 'admin'
  end
  
  def name
    [self.first_name, self.last_name].join(' ')
  end
end
