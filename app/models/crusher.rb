class Crusher
  def self.create_order(session, current_user, cart)
    order = Order.create(user_id: current_user.id, total: cart.total, status: "completed")
    cart.donations.each do |donation|
      donation.order_id = order.id
      donation.user_id  = current_user.id
      donation.save
    end
    send_text(order, current_user)
    order
  end

  def self.send_text(order, current_user)
    if current_user.phone_number
      SendNotification.new.text_message(current_user.phone_number, order, current_user)
    end
  end
end
