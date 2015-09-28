class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, email_format: { message: " is not in a valid format."}
  validates :password, length: { minimum: 8, message: "must have a minimum of 8 characters"}
  validates :password_confirmation, presence: true
end
