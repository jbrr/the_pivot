class CartController < ApplicationController

  def show
    @donations = session[:donations]
  end

  def update
    donation = cart.update(params)
    if donation.values.pop.to_i < 1
      flash[:errors] = "Donation must be greater than $1. Please try again!"
    elsif donation.values.pop.to_i > 2700
      flash[:errors] = "Per Federal Regulations: Personal Contributions must be below $2,700"
    else
      session[:donations] = session[:donations].merge(cart.update(params))
    end
    redirect_to cart_path
  end

  def destroy
    session[:donations][params[:id]] = nil
    redirect_to cart_path
  end
end