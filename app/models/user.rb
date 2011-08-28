class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :user_name, :email, :password, :password_confirmation
  
  before_save :encrypt_password  
  validates_confirmation_of :password
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email
  
  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  
  def self.authenticate(email, pass)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(pass, user.password_salt)
      user
    else
      nil
    end    
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
