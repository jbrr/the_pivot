class Cart
  attr_reader :raw_data

  def initialize(donations={})
    @donations = donations
  end

  def donations
    if @donations
      Donation.transform(@donations)
    end
  end

  def create(params)
    candidate_issue_id = params[:donation][:candidate_issue_id]
    donation ||= {}
    donation[candidate_issue_id] = (donation[candidate_issue_id].to_i
                                  + params[:donation][:amount].to_i).to_s
    donation
    validate_session(donation)
  end

  def validate_session(donation)
    if @donations
      add_to_cart(donation)
    else
      donation
    end
  end

  def add_to_cart(donation)
    @donations.merge(donation) do |key, old_val, new_val|
      (old_val.to_i + new_val.to_i).to_s
    end
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
