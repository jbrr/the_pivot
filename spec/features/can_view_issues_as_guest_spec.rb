require "rails_helper"

feature "Can view issues" do
  scenario "guest can see issues list" do
    Issue.create(topic: "gun control", description: "pro guns!")

    visit root_path
    expect(current_path).to eq("/")

    click_link "Browse All 2016 Issues"
    expect(current_path).to eq("/issues")

    within("#issues") do
      expect(page).to have_content("gun control")
      expect(page).to have_content("pro guns!")
    end
  end


  scenario "guest can see issues unique pictures" do
    Issue.create(topic: "Gun Control",
                 description: "less guns",
                 picture: "guns")
    Issue.create(topic: "Economy",
                 description: "more wealth",
                 picture: "economy")
    Issue.create(topic: "Marriage Equality",
                 description: "freedom for all",
                 picture: "marriage")

    visit issues_path

    within("#issues") do
      expect(page).to have_css("#guns-image")
      expect(page).to have_css("#economy-image")
      expect(page).to have_css("#marriage-image")
    end
  end
end
