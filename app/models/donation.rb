class Donation < ActiveRecord::Base
  belongs_to :candidate_issue
  belongs_to :user

  delegate :candidate, to: :candidate_issue
  delegate :issue, to: :candidate_issue
end
