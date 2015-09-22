require 'rails_helper'

RSpec.describe Issue, type: :model do
  it "exists" do
    expect(Issue).to be
  end

  context "is valid with proper attributes" do
    let(:valid_attributes) do
      {
        topic: "women's rights",
        description: "pro choice"
      }
    end

    let(:issue) { Issue.create(valid_attributes) }

    it "is valid" do
      expect(issue).to be_valid
    end

    it "must have a topic" do
      expect(issue.topic).to eq("women's rights")
    end

    it "must have a description" do
      expect(issue.description).to eq("pro choice")
    end
  end

  context "with invalid attributes" do
    let(:invalid_attributes) do
       {
        topic: nil,
        description: nil,
      }
    end

    let(:issue) { Issue.create(invalid_attributes) }

    it "is invalid" do
      expect(issue).to_not be_valid
    end
  end
end
