class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, email_format: { message: " is not in a valid format" }
  validates :phone_number, format: { with:/\A\d+\Z/, message: "can only contain numbers" }, length: { is: 10, message: "must be 10 numbers in length" }
  validates :password, length: { minimum: 8, message: "must have a minimum of 8 characters"}
  validates :password_confirmation, presence: true
end
