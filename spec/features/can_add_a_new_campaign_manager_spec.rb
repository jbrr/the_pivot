require "rails_helper"

feature "A logged in campaign manager" do
  scenario "can add a new campaign manager" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: manager.username
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Ted Cruz Dashboard"
    click_on "Add a Campaign Manager"

    fill_in "First name", with: "jef"
    fill_in "Last name", with: "jef"
    fill_in "Email", with: "jef@jef.jef"
    fill_in "Username", with: "Jef"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_on "Create Campaign Manager"

    click_on "Logout"

    within("#login-button") do
      click_link "Login"
    end

    fill_in "Username", with: "Jef"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Jef Jef")
    expect(page).to have_content("Ted Cruz Dashboard")

    click_on "Ted Cruz Dashboard"

    expect(page).to have_content("Add a Campaign Manager")
  end
end
