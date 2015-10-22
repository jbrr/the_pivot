require "rails_helper"

describe DonationChart do
  it "exists" do
    expect(DonationChart).to be
  end

  it "returns a nested array" do
    test_setup

    donation_dates = DonationChart.donation_by_date(candidate)
    expect(donation_dates.include?("200")).to eq(true)
    expect(donation_dates.include?("new Date")).to eq(true)
  end
end
