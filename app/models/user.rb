class User < ActiveRecord::Base
  
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip).try(:authenticate, password) || nil
  end
end
