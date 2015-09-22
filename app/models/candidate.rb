class Candidate < ActiveRecord::Base
  has_many :issues, through: :candidates_issues
  has_many :candidates_issues
  validates :name, :bio, :party, presence: true
end
