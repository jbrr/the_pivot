class OrdersController < ApplicationController
  def show
    @order = Order.find(params["id"])
    @donations = Donation.where(order_id: @order.id)
  end
end
