class CandidateIssue < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :issue
end
