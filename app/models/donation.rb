class Donation < ActiveRecord::Base
  belongs_to :candidate_issue
  belongs_to :user
  belongs_to :order

  delegate :candidate, to: :candidate_issue
  delegate :issue, to: :candidate_issue

  validates :amount, :numericality => { :greater_than => 0, :less_than => 2700 }, presence: true


  def self.transform(donations)
    donations.map do |candidate_issue_id, amount|
      Donation.new(candidate_issue_id: candidate_issue_id, amount: amount)
    end
  end
end
