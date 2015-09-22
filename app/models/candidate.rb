class Candidate < ActiveRecord::Base
  has_many :issues, through: :candidate_issues
  has_many :candidate_issues
  validates :name, :bio, :party, presence: true
end
