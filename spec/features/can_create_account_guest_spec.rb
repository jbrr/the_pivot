require "rails_helper"

feature "guest creates an account" do
  scenario "guest visits the login page" do
    visit root_path
    click_on "Join"
    expect(current_path).to eq(new_user_path)
  end

  scenario "guest registers an account" do
    visit new_user_path
    fill_in "user[first_name]", with: "Donald"
    fill_in "user[last_name]", with: "Trump"
    fill_in "user[email]", with: "trump@luxury.com"
    fill_in "user[username]", with: "trumpcard"
    fill_in "user[password]", with: "luxurious"
    click_on "Join Earmarked"

    user = User.find(1)

    expect(current_path).to eq(user_path(user))
  end
end
