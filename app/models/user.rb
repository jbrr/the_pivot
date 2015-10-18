class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, email_format: { message: " is not in a valid format" }
  validates :phone_number, format: { with:/\A\d+\Z/, message: "can only contain numbers" }, length: { is: 10, message: "must be 10 numbers in length" }, allow_blank: true
  validates :password, length: { minimum: 8, message: "must have a minimum of 8 characters"}
  validates :password_confirmation, presence: true

  before_validation :capitalize

  def capitalize
    self.first_name = first_name.to_s.capitalize
    self.last_name = last_name.to_s.capitalize
    self.username = username.to_s.capitalize
  end

  def self.completed(id)
    Order.where("user_id = ? AND status = ? ", id, "completed")
  end

  def self.pending(id)
    @orders_pending = Order.where("user_id = ? AND status = ? ", id, "pending")
  end

  def self.cancelled(id)
    @orders_cancelled = Order.where("user_id = ? AND status = ? ", id, "cancelled")
  end

  def registered_user?
    roles.exists?(name: "registered_user")
  end

  def campaign_manager?
    roles.exists?(name: "campaign_manager")
  end

  def platform_admin?
    roles.exists?(name: "platform_admin")
  end
end
