class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :email, :password, :password_confirmation
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, length: {minimum: 3}
  # PASSWORD_REQUIREMENTS = /\A
  # (?=.{3,})

  # /x
  # validates :password, format: PASSWORD_REQUIREMENTS
  before_validation :downcase

  def authenticate_with_credentials(email, password)
    # encrypted_password = BCrypt::Engine.hash_secret(password)
    # user = User.find_for_authentication(:username => username)
    email = email.strip
    email = email.downcase
    user = User.find_by_email(email)
    # user.where("LOWER(email) = ?", email.downcase)
   
    if user && user.authenticate(password) 
      return user
    else
      puts "FALSE"
      puts email
      puts password
      return false
    end
  end

  def downcase
    self.email = self.email.downcase unless self.email == nil
  end

end
