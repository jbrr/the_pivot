require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {
    User.create(first_name: "Donald", last_name: "Trump", email: "trump@luxury.com", username: "therealtrump", password: "password", password_confirmation: "password")
  }

  let(:order) {
     Order.create(total: 420, user_id: user.id, status: "completed")
  }

  it "is valid" do
    expect(order).to be_valid
  end

  it "is invalid without a total" do
    order.total = nil
    expect(order).to be_invalid
  end

  it "is must reference a user" do
    order.user_id = nil
    expect(order).to be_invalid
  end

  it "is invalid without status" do
    order.status = nil
    expect(order).to be_invalid
  end

  it "must have an integer amount" do
    order.total = "himom"
    expect(order).to be_invalid
  end
end
