require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :posts
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates :email,  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :message => 'Are you sure that this email?' }
  attr_accessor :password_confirmation
  attr_accessor :password
  
  class << self
    def authenticate(email, password)
      if user = find_by_email(email)
        if user.encrypted_password == encrypt_password(password, user.salt)
          return user
        end
      end
    end
  
    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + " wibble" + salt)
    end
  end
 
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.encrypted_password = self.class.encrypt_password(password, salt)
    end
  end
 
  private
  def password_must_be_present
    errors.add(:password, " Missing password " ) unless encrypted_password.present?
  end
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
