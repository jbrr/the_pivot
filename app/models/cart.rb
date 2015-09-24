class Cart
  attr_reader :raw_data

  def initialize(donations={})
    @donations = donations
  end

  def donations
    @donations.map do |candidate_issue_id, amount|
      Donation.new(candidate_issue_id: candidate_issue_id, amount: amount)
    end
  end

  def add(params)
    candidate_issue_id = params[:donation][:candidate_issue_id]
    donations ||= {}

    if donations[candidate_issue_id]
      donations[candidate_issue_id] = (donations[candidate_issue_id].to_i + params[:donation][:amount].to_i).to_s
    else
      donations[candidate_issue_id] = params[:donation][:amount]
    end
  
    donations
  end
end
