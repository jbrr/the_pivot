require "rails_helper"

feature "guest creates an account" do
  scenario "guest visits the login page" do
    visit root_path
    click_on "Join"
    expect(current_path).to eq(join_path)
  end

  scenario "guest registers an account" do
    visit join_path
    fill_in "user[first_name]", with: "Donald"
    fill_in "user[last_name]", with: "Trump"
    fill_in "user[email]", with: "trump@luxury.com"
    fill_in "user[username]", with: "trumpcard"
    fill_in "user[password]", with: "luxurious"
    fill_in "user[password_confirmation]", with: "luxurious"
    click_on "Join Earmarked"

    user = User.find_by(email: "trump@luxury.com")

    expect(current_path).to eq(profile_path)
    within("#user_names") do
      expect(page).to have_content("Donald Trump")
    end
  end

  scenario "guest cannot register account without matching passwords" do
    visit join_path
    fill_in "user[first_name]", with: "Donald"
    fill_in "user[last_name]", with: "Trump"
    fill_in "user[email]", with: "trump@luxury.com"
    fill_in "user[username]", with: "trumpcard"
    fill_in "user[password]", with: "luxurious1"
    fill_in "user[password_confirmation]", with: "luxurious"
    click_on "Join Earmarked"

    expect(current_path).to eq(join_path)
  end
end
