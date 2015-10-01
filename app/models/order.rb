class Order < ActiveRecord::Base
  belongs_to :user
  has_many :donations

  validates :total, :user_id, :status, presence: true
  validates :total, numericality: { only_integer: true }

  def when_created
    created_at.strftime("%A, %B %d, %Y at %I:%M%p")
  end

  def when_created_short
    created_at.strftime(" %B %d, %Y ")
  end
end
