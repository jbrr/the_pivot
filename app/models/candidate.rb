class Candidate < ActiveRecord::Base
  has_many :issues, through: :candidate_issues
  has_many :candidate_issues
  validates :name, :bio, :party, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
