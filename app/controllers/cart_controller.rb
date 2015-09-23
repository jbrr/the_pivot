class CartController < ApplicationController

  def show
    @donations = session[:donations]
  end

end
