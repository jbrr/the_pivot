class DonationChart < ActiveRecord::Base
  def self.donation_by_date(candidate)
    donation_date = []
    candidate.donations.map do |donation|
      parsed_date = donation.created_at.strftime("%s").to_i * 1000
      donation_date << ["new Date(#{parsed_date})", donation.amount]
    end
    donation_date = donation_date.to_s.gsub('"', '')
  end

  def self.donation_issues
    Issue.all.map {|issue| issue.topic }
  end

  def self.issue_donation_total
    Issue.all.map do |issue|
      issue.candidate_issues.map { |candidate_issue| candidate_issue.donations.
        map { |donation| donation.amount }}.reduce(:+).reduce(:+)
    end.map do |num|
      if num.nil?
        0
      else
        num
      end
    end  
  end

  def self.donations_by_issue(candidate)
    donation_candidate_issue = []
    donation_issues.zip(issue_donation_total)
  end
end
