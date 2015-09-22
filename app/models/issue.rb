class Issue < ActiveRecord::Base
  has_many :candidates, through: :candidates_issues
  validates :topic, :description, presence: true
end
