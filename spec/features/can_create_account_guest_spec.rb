require "rails_helper"

feature "guest creates an account" do
  scenario "guest visits the login page" do
    visit root_path
    click_on "Join"
    expect(current_path).to eq(join_path)
  end

  scenario "guest registers an account" do
    visit join_path
    fill_in "join[first_name]", with: "Donald"
    fill_in "join[last_name]", with: "Trump"
    fill_in "join[email]", with: "trump@luxury.com"
    fill_in "join[username]", with: "trumpcard"
    fill_in "join[password]", with: "luxurious"
    fill_in "join[password_confirmation]", with: "luxurious"
    click_on "Join Earmarked"

    user = User.find_by(email: "trump@luxury.com")

    expect(current_path).to eq(profile_path)
    within("#user_names") do
      expect(page).to have_content("Donald Trump")
    end
  end

  scenario "guest cannot register account without matching passwords" do
    visit join_path
    fill_in "join[first_name]", with: "Donald"
    fill_in "join[last_name]", with: "Trump"
    fill_in "join[email]", with: "trump@luxury.com"
    fill_in "join[username]", with: "trumpcard"
    fill_in "join[password]", with: "luxurious1"
    fill_in "join[password_confirmation]", with: "luxurious"
    click_on "Join Earmarked"

    expect(current_path).to eq(profile_path)
  end
end
