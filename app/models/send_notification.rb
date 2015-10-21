class SendNotification
  def initialize
    @client = Twilio::REST::Client.new(ENV["twilio_sid"], ENV["twilio_token"])
  end

  def text_message(number, order, current_user)
    @client.messages.create from: "7205063550",
                            to: number,
                            body: "Thanks for donating $#{order.
                            total}.00 through Earmarked, #{current_user.first_name}!"
  end

  def phone_word(code, number)
    @client.messages.create from: "7205063550",
                            to: number,
                            body: code

  end

end
