class Candidate < ActiveRecord::Base
  has_many :issues, through: :candidate_issues
  has_many :donations, through: :candidate_issues
  has_many :candidate_issues
  has_many :user_roles
  has_many :users, through: :user_roles
  validates :name, :bio, :party, :twitter_handle, presence: true
  validates :slug, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
