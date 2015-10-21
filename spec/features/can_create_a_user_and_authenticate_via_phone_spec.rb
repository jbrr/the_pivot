require "rails_helper"

feature "guest creates an account" do
  scenario "guest visits the login page" do
    test_setup

    visit root_path
    click_on "Join"
    expect(current_path).to eq(join_path)
  end

  scenario "guest registers an account with a phone number" do
    test_setup

    visit join_path

    fill_in "user[first_name]", with: "R"
    fill_in "user[last_name]", with: "B"
    fill_in "user[email]", with: "regis@reeg.com"
    fill_in "user[phone_number]", with: "7037952610"
    fill_in "user[username]", with: "reeg"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Join Earmarked"

    user = User.find_by(email: "regis@reeg.com")

    expect(current_path).to eq(two_factor_authentication_path(user.id))
    expect(page).to have_content("Auth")

    fill_in "user[auth_code]", with: "9999"
    click_on "Submit Auth Code"

    expect(current_path).to eq(profile_path)
    within("#user_names") do
      expect(page).to have_content("R B")
    end
  end

end
