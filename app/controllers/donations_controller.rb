class DonationsController < ApplicationController

  def create
    if validate_params
      session[:donations] = validate_session
      flash[:notice] = "Donation added to cart."
    else
      session[:donations]
      flash[:errors] = "Donation cannot be empty."
    end
    return_to_origin_page
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

  def create_cart
    cart.create(params)
  end

  def validate_session
    if session[:donations]
      add_to_cart
    else
      create_cart
    end
  end

  def add_to_cart
   session[:donations].merge(create_cart) do |key, old_val, new_val|
      (old_val.to_i + new_val.to_i).to_s
    end
  end
end
