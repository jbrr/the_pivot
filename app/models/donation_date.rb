class DonationDate
  attr_reader :current_candidate, :donations

  def initialize(current_candidate)
    @current_candidate = current_candidate
    @donations = current_candidate.donations
  end
end
