class ChargesController < ApplicationController

  def new
    @amount = (cart.total * 100)
  end

  def create
      @amount = (cart.total * 100)

      customer = Stripe::Customer.create(
        :email => 'example@stripe.com',
        :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      order = Crusher.create_order(session, current_user, cart)
      session[:donations].clear
      if current_user.phone_number
        SendNotification.new.text_message(current_user.phone_number, order, current_user)
      end

      redirect_to order_path(order)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
end

class Crusher
  def self.create_order(session, current_user, cart)
    order = Order.create(user_id: current_user.id, total: cart.total)
    cart.donations.each do |donation|
      donation.order_id = order.id
      donation.user_id  = current_user.id
      donation.save
    end
    order
  end
end