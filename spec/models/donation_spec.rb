require 'rails_helper'

RSpec.describe Donation, type: :model do
  context "is valid with proper attributes" do
    let(:user) {
      User.create(first_name: "Donald", last_name: "Trump", email: "trump@luxury.com", username: "therealtrump", password: "password", password_confirmation: "password")
    }
    let(:candidate_issue) {
      CandidateIssue.create
    }

    let(:valid_attributes) do
      {
                    amount: 100,
        candidate_issue_id: candidate_issue.id,
                   user_id: user.id
      }
    end

    let(:donation) { Donation.create(valid_attributes) }

    it "is valid" do
      expect(donation).to be_valid
    end

    it "has an amount" do
      expect(donation.amount).to eq(100)
    end

    it "has a candidate_issue_id" do
      expect(donation.candidate_issue_id).to eq(candidate_issue.id)
    end

    it "has a user_id" do
      expect(donation.user_id).to eq(user.id)
    end
  end

  context "with invalid attributes" do
    let(:invalid_attributes) do
       {
                    amount: nil,
        candidate_issue_id: nil,
                   user_id: nil
        }
    end

    let(:donation) { Donation.create(invalid_attributes) }

    it "is invalid" do
      expect(donation).to_not be_valid
    end
  end
end
