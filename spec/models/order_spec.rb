require 'rails_helper'

RSpec.describe User, type: :model do

  let(:candidate) {
    Candidate.create(name: "Donald Trump", party: "Republican", bio: "Was born in the most luxurious crib the world has ever seen", featured: true, last_name: "trump")
  }

  let(:issue) {
    Issue.create(topic: "Environment", description: "Set to be a hotly contested issue", featured: true, picture: 'environment')
  }

  let(:candidate_issue) {
    CandidateIssue.create(stance: "This is a big f**king deal!", candidate_id: candidate.id, issue_id: issue.id)
  }

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

  it "is associated with a user" do
    expect(order).to respond_to(:user)
  end

  it "must reference a donation" do
    order.donations.build(amount: 240, candidate_issue_id: candidate_issue.id, user_id: user.id, order_id: order.id)
    expect(order.donations.map(&:amount)).to eq([240])
    expect(order.donations.map(&:candidate_issue_id)).to eq([candidate_issue.id])
    expect(order.donations.map(&:user_id)).to eq([user.id])
    expect(order.donations.map(&:order_id)).to eq([order.id])
  end
end
