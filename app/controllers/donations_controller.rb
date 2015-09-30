class DonationsController < ApplicationController

  def create
    if validate_params
      session[:donations] = cart.create(params)
      flash[:notice] = "Donation added to cart."
    else
      session[:donations]
      flash[:errors] = "Invalid Donation."
    end
    return_to_origin_page
  end

  def undo
    params[:donation] = {
                          "candidate_issue_id" => session[:undo].keys.first,
                                      "amount" => session[:undo].values.first
                         }
    session[:donations] = cart.create(params)
    redirect_to cart_path
  end

  private

  def return_to_origin_page
    if candidate_id
      redirect_to(candidate_path(candidate_id))
    else
      redirect_to(issue_path(issue_id))
    end
  end

  def candidate_id
    params[:donation][:candidate_id]
  end

  def issue_id
    params[:donation][:issue_id]
  end
end
