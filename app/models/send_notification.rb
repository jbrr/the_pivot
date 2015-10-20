class SendNotification
  def initialize
    @client = Twilio::REST::Client.new(ENV["twilio_sid"], ENV["twilio_token"])
  end

  PHONEWORD = [rand(1..11), rand(1..11), rand(1..11), rand(1..11)]

  def text_message(number, order, current_user)
    @client.messages.create from: "7205063550",
                            to: number,
                            body: "Thanks for donating $#{order.
                            total}.00 through Earmarked, #{current_user.first_name}!"
  end

  def phone_word
    @client.messages.create from: "7205063550",
                            to: number,
                            body: "#{PHONEWORD.join.to_i}"

  end
end
