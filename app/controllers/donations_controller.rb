class DonationsController < ApplicationController

  def create
    if validate_params
      session[:donations] = cart.create(params)
      flash[:success] = "Donation added to cart."
    else
      session[:donations]
      flash[:errors] = "Invalid Donation."
    end
    redirect_to params[:donation][:origin_page]
  end

  def undo
    params[:donation] = { "candidate_issue_id" => session[:undo].keys.first,
                                      "amount" => session[:undo].values.first }
    session[:donations] = cart.create(params)
    redirect_to cart_path
  end
end