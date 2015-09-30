require "rails_helper"

feature "Can view individual issue" do
  scenario "as a visitor" do
    test_setup

    visit issues_path
    expect(current_path).to eq("/issues")

    click_link "Gun Control"
    expect(current_path).to eq("/issues/#{issue.id}")

    expect(page).to have_content("Gun Control")
    expect(page).to have_content("Guns Guns Guns!")

    within("#stances") do
      expect(page).to have_content("Trump")
      expect(page).to have_content("Luxurious guns!")
      expect(page).to have_button("Donate")
    end
  end

  scenario "visitor views another issue" do
    test_setup

    visit issues_path
    expect(current_path).to eq("/issues")

    click_link "Gun Control"
    expect(current_path).to eq("/issues/#{issue.id}")

    expect(page).to have_content("Gun Control")
    expect(page).to have_content("Guns!")

    within("#stances") do
      expect(page).to have_content("Trump")
      expect(page).to have_content("Luxurious guns!")
      expect(page).to have_button("Donate")
    end
  end
end
