require "rails_helper"

feature "New campaign manager form is visible" do
  scenario "to a campaign manager" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: manager.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/dashboards/new"
    expect(current_path).to eq("/admin/dashboards/new")
  end

  scenario "not to a platform admin" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/dashboards/new"
    expect(current_path).to eq(root_path)
  end

  scenario "not to a registered user" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/dashboards/new"
    expect(current_path).to eq(root_path)
  end
end
