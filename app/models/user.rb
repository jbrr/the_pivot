class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, :username, presence: true, uniqueness: true
  validates :email, email_format: { message: "Not a valid email format."}
  validates :password, length: { minimum: 8, message: "Your password must have a minimum of 8 characters" }
end
