class CandidateIssue < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :issue
  has_many :donations

  delegate :topic, to: :issue
  delegate :name, to: :candidate
end
