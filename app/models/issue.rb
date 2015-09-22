class Issue < ActiveRecord::Base
  has_many :candidates, through: :candidate_issues
  has_many :candidate_issues
  validates :topic, :description, presence: true
end
