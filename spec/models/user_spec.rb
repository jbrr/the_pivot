require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {
    User.new(first_name: "Donald", last_name: "Trump", email: "trump@luxury.com", username: "therealtrump", password: "password")
  }
  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user.first_name = nil
    expect(user).to be_invalid
  end

  it "is invalid without a last name" do
    user.last_name = nil
    expect(user).to be_invalid
  end

  it "is invalid without a email" do
    user.email = nil
    expect(user).to be_invalid
  end

  it "is invalid without a username" do
    user.username = nil
    expect(user).to be_invalid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to be_invalid
  end

  it "is invalid with short password" do
    user.password = "fail"
    expect(user).to be_invalid
  end

  it "is invalid with random string for email" do
    user.email = "asdlkfjalgalwrg"
    expect(user).to be_invalid
  end
end
