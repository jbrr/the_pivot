class Cart
  def initialize(data={})
    @data = data
  end

  def donations
    @data.map do |candidate_issue_id, amount|
      Donation.new(candidate_issue_id: candidate_issue_id, amount: amount)
    end
  end
end
