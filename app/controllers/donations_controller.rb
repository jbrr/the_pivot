class DonationsController < ApplicationController

  def create
    if session[:donations]
      session[:donations] = session[:donations].merge(cart.add(params))
    else
      session[:donations] = cart.add(params)
    end
    return_to_origin_page
  end

  def edit
    redirect_to cart_path
  end

  def delete
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
