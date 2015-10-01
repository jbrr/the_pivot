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
    session[:undo] = stored_donation
    cart.delete(params)
    flash[:success] = "Your donation to #{find_candidate}'s #{find_issue}
                      campaign has been removed from your cart.
                      Click <a href='/donations/undo'><strong>HERE</strong></a>
                      to resubmit your donation."
    redirect_to cart_path
  end

  private

    def find_issue
      CandidateIssue.find(params[:id]).topic
    end

    def find_candidate
      CandidateIssue.find(params[:id]).name
    end

    def stored_donation
      { params[:id] => session[:donations][params[:id]] }
    end
end