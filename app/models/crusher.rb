class Crusher

  PHONEWORD = [rand(1..11), rand(1..11), rand(1..11), rand(1..11)]

  def self.code
    "#{PHONEWORD.join.to_i}"
  end

  def self.create_order(session, current_user, cart)
    order = Order.create(user_id: current_user.id,
                         total: cart.total, status: "completed")
    cart.donations.each do |donation|
      donation.order_id = order.id
      donation.user_id  = current_user.id
      donation.save
    end
    if current_user.phone_number == nil
      order
    else
      send_text(order, current_user)
      order
    end
  end

  def self.send_test_code(current_user)
    code = "9999"
    current_user.update_attribute("sent_code", code)
    current_user.save
  end

  def self.send_phone_password(current_user)
    if current_user.phone_number != ""
      SendNotification.new.phone_word(code, current_user.phone_number)
      current_user.update_attribute("sent_code", code)
      current_user.save
    end
  end

  def self.send_text(order, current_user)
    if current_user.phone_number != "" || nil
      SendNotification.new.text_message(current_user.phone_number,
                                        order, current_user)
    end
  end

end
