class Donation < ActiveRecord::Base
  belongs_to :candidate_issue
  belongs_to :user
end
