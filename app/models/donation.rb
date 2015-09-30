class Donation < ActiveRecord::Base
  belongs_to :candidate_issue
  belongs_to :user
  belongs_to :order

  delegate :candidate, to: :candidate_issue
  delegate :issue, to: :candidate_issue

  validates :amount, :numericality => { :greater_than => 0, :less_than => 2700 }, presence: true
end
