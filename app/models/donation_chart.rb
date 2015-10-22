class DonationChart < ActiveRecord::Base
 def self.donation_by_date(candidate)
   donation_date = []
   candidate.donations.map do |donation|
     parsed_date = donation.created_at.strftime("%s").to_i * 1000
     donation_date << ["new Date(#{parsed_date})", donation.amount]
   end
   donation_date = donation_date.to_s.gsub('"', '')
 end
 
 def self.donations_by_issue(candidate)
   donations_by_issue = candidate.candidate_issues.joins(:donations).group(:issue_id).sum(:amount)
   donations_by_issue.map { |issue_id, amt| [ Issue.find(issue_id).topic, amt ] }
 end
end
