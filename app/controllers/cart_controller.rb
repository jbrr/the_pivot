class CartController < ApplicationController

  def show
    @donations = session[:donations]
  end

  def update
    donation = cart.update(params)
    if donation.values.pop.to_i < 0
      flash[:notice] = "Donation must be greater than 0. Please try again!"
    else
      session[:donations] = session[:donations].merge(cart.update(params))
    end
    redirect_to cart_path
  end

  def destroy
    require 'pry'; binding.pry
    session[:donations][params[:id]] = nil
    flash[:notice] = "#{find_issue} has been removed from your cart. Click HERE to undo."
    redirect_to cart_path
  end

  private

  def find_issue
    Issue.find_by(params[:issue_id]).topic
  end
end