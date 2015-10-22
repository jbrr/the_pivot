class ChargesController < ApplicationController

  def new
    @amount = (cart.total * 100)
  end

  def create
    @amount = (cart.total * 100)

    customer = Stripe::Customer.create(
      :email => "example@stripe.com",
      :card  => params[:stripeToken]
    )

    Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Rails Stripe customer",
      :currency    => "usd"
    )

    order = Sender.create_order(session, current_user, cart)
    session[:donations].clear

    redirect_to order_path(order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
