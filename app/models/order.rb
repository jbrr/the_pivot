class Order < ActiveRecord::Base
  belongs_to :user
  has_many :donations

  validates :total, :user_id, :status, presence: true
  validates :total, numericality: { only_integer: true }
end
