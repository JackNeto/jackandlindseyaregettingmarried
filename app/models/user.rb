class User < ActiveRecord::Base
  
  # >> AR Extensions --------------------------------------------------------
  
  wristband :login_with => :email,
            :roles => [:regular_user, :admin],
            :after_authentication => :is_verified?

  has_attached_file :avatar,
                    :styles => { 
                      :original => "100x100>", 
                      :thumb => "50x50>" 
                    }
  
  # >> Validations ----------------------------------------------------------

  validates_length_of :email,
    :if         => :password_required?,
    :in         => 6..100,
    :too_short  => 'Your email address needs to be at least 6 characters long.'
  validates_format_of :email,
    :if         => :password_required?,
    :message    => 'The email you entered is not valid.',
    :with       => /^([\w.%-+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_uniqueness_of :email,
    :if         => :password_required?,
    :case_sensitive => false,
    :message    => 'This email has already been taken.'
  validates_length_of :password,
    :if         => :password_required?,
    :within     => 4..40,
    :too_short  => 'The password you entered is too short (minimum is 4 characters).'
  validates_presence_of :password,
    :if         => :password_required?,
    :message    => 'Please choose a password.'
  validates_presence_of :password_confirmation,
    :if         => :password_required?,
    :message    => 'Please type your password again.'
  validates_confirmation_of :password,
    :if         => :password_required?,
    :message    => 'The password you entered does not match with the confirmation.'
  validates_presence_of :first_name,
    :message    => 'Please enter your first name.'
  validates_presence_of :last_name,
    :message    => 'Please enter your last name.'

  # >> Attributes -----------------------------------------------------------

  attr_accessor :remember_me
  
  # >> Instance methods ----------------------------------------------------------
  
  def name
    [self.first_name, self.last_name].join(' ')
  end
  
protected

  def password_required?
    !is_stub? && ((new_record? || !password.blank?) || is_stub_changed?)
  end
end
