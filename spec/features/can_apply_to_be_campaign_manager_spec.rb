require "rails_helper"

feature "A registered user can apply to be a campaign manager" do
  scenario "and be accepted or denied" do
    test_setup

    visit root_path
    within("#login-button") do
      click_link "Login"
    end

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Candidates"
    click_on "Ted Cruz"
    click_on "Apply Now"
    fill_in "Reason", with: "I want to do this"
    click_on "Save changes"

    click_on "Logout"

    within("#login-button") do
      click_link "Login"
    end

    fill_in "Username", with: user2.username
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Candidates"
    click_on "Donald Trump"
    click_on "Apply Now"
    fill_in "Reason", with: "He's a good candidate"
    click_on "Save changes"

    click_on "Logout"

    within("#login-button") do
      click_link "Login"
    end

    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Dashboard"
    expect(page).to have_content("Regis")
    expect(page).to have_content("Therealtrump")
    expect(page).to have_content("He's a good candidate")
    expect(page).to have_content("I want to do this")

    within('.text-center') do
      first(:link, "Approve").click
    end

    expect(page).not_to have_content("Therealtrump")
    expect(page).to have_content("Regis")

    click_on "Decline"

    expect(page).not_to have_content("Regis")

    click_on "Logout"

    within("#login-button") do
      click_link "Login"
    end

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Ted Cruz Dashboard")
  end
end
