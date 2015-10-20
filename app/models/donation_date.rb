class DonationDate
  attr_reader :current_candidate, :donations

  def initialize(current_candidate)
    @current_candidate = current_candidate
    @donations = current_candidate.donations
  end

  def donation_day
    @donations.map { |donation| donation.created_at.strftime("%B %d %Y") }
  end
end
