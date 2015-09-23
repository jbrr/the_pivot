require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it "exists" do
    expect(Candidate).to be
  end

  context "is valid with proper attributes" do
    let(:valid_attributes) do
      {
        name: "travis",
        bio: "is a boi",
        party: "baller"
      }
    end

    let(:candidate) { Candidate.create(valid_attributes) }

    it "is valid" do
      expect(candidate).to be_valid
    end

    it "must have a name" do
      expect(candidate.name).to eq("travis")
    end

    it "must have a party" do
      expect(candidate.party).to eq("baller")
    end

    it "must have a bio" do
      expect(candidate.bio).to eq("is a boi")
    end
  end

  context "with invalid attributes" do
    let(:invalid_attributes) do
       {
        name: nil,
        bio: nil,
        party: nil
      }
    end

    let(:candidate) { Candidate.create(invalid_attributes) }

    it "is invalid" do
      expect(candidate).to_not be_valid
    end
  end
end
