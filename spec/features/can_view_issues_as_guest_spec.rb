require "rails_helper"

feature "Can view issues" do
  scenario "guest can see issues list" do
    Issue.create(topic: "gun control", description: "pro guns!")

    visit root_path
    expect(current_path).to eq("/")

    click_link "Browse 2016 Issues"
    expect(current_path).to eq("/issues")

    within("#issues") do
      expect(page).to have_content("Gun Control")
      expect(page).to have_content("pro guns!")
    end
  end
end
