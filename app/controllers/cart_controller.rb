class CartController < ApplicationController

  def show
    @donations = session[:donations]
  end

  def update
    session[:donations] = session[:donations].merge(cart.update(params))
    redirect_to cart_path
  end
end