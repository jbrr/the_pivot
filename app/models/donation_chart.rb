class DonationChart
  def self.donation_by_date(candidate)
    donation_date = []
    candidate.donations.map do |donation|
      parsed_date = donation.created_at.strftime("%s").to_i * 1000
      donation_date << ["new Date(#{parsed_date})", donation.amount]
    end
    donation_date = donation_date.to_s.gsub('"','')
  end
end
