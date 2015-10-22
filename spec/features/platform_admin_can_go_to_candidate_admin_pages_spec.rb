require "rails_helper"

feature "platform admin" do
  scenario "logs in" do
    test_setup

    visit root_path
    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)
  end

  scenario "platform admin can see buttons to all the candidates" do
    test_setup

    visit login_path

    user = admin

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(profile_path)

    click_link "Dashboard"
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Donald Trump")
  end

end
