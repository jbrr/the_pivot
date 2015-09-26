require "rails_helper"

feature "Logged in user views profile page" do

  before do
    user = User.create(first_name: "Donald",
                            last_name: "Trump",
                            email: "trump@luxury.com",
                            username: "therealtrump",
                            password: "password",
                            password_confirmation: "password")
    visit root_path
    within("#navbar") do
      click_link "Login"
    end
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
  end

  scenario "can use buttons to view candidates and issues" do
    user = User.find_by(username: "therealtrump")
    visit profile_path(user)

    expect(page).to have_link("View 2016 Candidates")
    expect(page).to have_link("View 2016 Issues")

    click_on("View 2016 Candidates")
    expect(current_path).to eq(candidates_path)

    visit profile_path
    click_on("View 2016 Issues")
    expect(current_path).to eq(issues_path)
  end

  scenario "has title for stances supported" do
    user = User.find_by(username: "therealtrump")
    visit profile_path(user)

    within("#stances_supported") do
      expect(page).to have_content("Stances Supported")
    end

    within("#pending_orders") do
      expect(page).to have_content("Pending Orders")
    end
  end
end
