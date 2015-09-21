class Candidate < ActiveRecord::Base
  validates :name, :bio, :party, presence: true
end