class DonationsController < ApplicationController

  def create
    session[:donations] = cart.add(params)
    direct_to
  end

  private
  
  def direct_to
    candidate_id = params[:donation][:candidate_id]
    issue_id     = params[:donation][:issue_id]

    if candidate_id
      redirect_to(candidate_path(candidate_id))
    else
      redirect_to(issue_path(issue_id))
    end
  end
end
