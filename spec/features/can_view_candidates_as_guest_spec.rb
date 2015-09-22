require "rails_helper"

feature "Can view candidates" do
  scenario "guest can see candidates list" do
    Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious")

    visit root_path
    expect(current_path).to eq("/")

    click_link "Browse 2016 Candidates"
    expect(current_path).to eq("/candidates")

    within("#candidates") do
      expect(page).to have_content("Democrat")
      expect(page).to have_content("Trump")
    end
  end
end
