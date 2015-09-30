require "rails_helper"

feature "Can view individual candidate" do
  scenario "as a visitor" do
    test_setup

    visit candidates_path
    expect(current_path).to eq("/candidates")

    click_link "Donald Trump"
    expect(current_path).to eq("/candidates/#{candidate2.id}")

    expect(page).to have_content("Trump")
    expect(page).to have_content("Luxurious")

    within("#stances") do
      expect(page).to have_content("Gun Control")
      expect(page).to have_content("Luxurious guns!")
      expect(page).to have_button("Donate")
    end
  end

  scenario "visitor views another candidate" do
    test_setup

    visit candidates_path
    expect(current_path).to eq("/candidates")

    click_link "Ted Cruz"
    expect(current_path).to eq("/candidates/#{candidate.id}")

    expect(page).to have_content("Cruz")
    expect(page).to have_content("Kim")

    within("#stances") do
      expect(page).to have_content("Gun Control")
      expect(page).to have_content("Guns!")
      expect(page).to have_button("Donate")
    end
  end
end
