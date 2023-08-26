class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true


  # Convert email to downcase before saving
  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end
end