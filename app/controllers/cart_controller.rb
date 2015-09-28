class CartController < ApplicationController

  def show
    @donations = session[:donations]
  end

  def update
    if validate_params
      session[:donations] = session[:donations].merge(cart.update(params))
    else
      session[:donations]
      flash[:errors] = "Invalid Donation."
    end
    redirect_to cart_path
  end

  def destroy
    cart.delete(params)
    flash[:notice] = "Your <strong>donation</strong> to #{find_candidate}'s #{find_issue} campaign has been removed from your cart. <a href='/candidates'>CLICK HERE TO RESUBMIT YOUR DONATION</a>"
    redirect_to cart_path
  end

  private

  def find_issue
    CandidateIssue.find(params[:id]).topic
  end

  def find_candidate
    CandidateIssue.find(params[:id]).name
  end
end