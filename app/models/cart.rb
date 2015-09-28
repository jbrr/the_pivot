class Cart
  attr_reader :raw_data

  def initialize(donations={})
    @donations = donations
  end

  def donations
    if @donations
      @donations.map do |candidate_issue_id, amount|
        Donation.new(candidate_issue_id: candidate_issue_id, amount: amount)
      end
    end
  end

  def create(params)
    candidate_issue_id = params[:donation][:candidate_issue_id]
    donations ||= {}
    donations[candidate_issue_id] = (donations[candidate_issue_id].to_i + params[:donation][:amount].to_i).to_s
    donations
  end

  def total
    @donations.values.inject(0) { |sum, x| sum + x.to_i } if @donations
  end

  def update(params)
    {params[:id] => params[:donation][:amount]}
  end

  def delete(params)
    @donations.delete(params[:id])
  end
end