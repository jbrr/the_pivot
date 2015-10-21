class DonationChart
  def self.donation_by_date(candidate)
    donation_date = []
    candidate.donations.map do |donation|
      parsed_date = donation.created_at.strftime("%s").to_i * 1000
      donation_date << ["new Date(#{parsed_date})", donation.amount]
    end
    donation_date = donation_date.to_s.gsub('"', '')
  end

  def self.donations_by_issue(candidate)
    donation_candidate_issue = []
    candidate.donations.map do |donation|
      donation_topic = donation.issue.topic
      donation_candidate_issue << ["#{donation_topic}", donation.amount]
    end
    donation_candidate_issue
  end
end
