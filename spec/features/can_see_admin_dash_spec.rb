require "rails_helper"

feature "a logged in user" do
  scenario "can see admin dashboard if platform admin" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/dashboards/show"
    expect(current_path).to eq("/admin/dashboards/show")
  end

  scenario "can not see admin dashboard if campaign manager" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: manager.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/dashboards/show"
    expect(current_path).to eq(root_path)
  end

  scenario "can not see admin dashboard if registered user" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/dashboards/show"
    expect(current_path).to eq(root_path)
  end

  scenario "can see new manager form if campaign manager" do
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

  scenario "can not see new manager form if platform admin" do
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

  scenario "can not see new manager form if registered user" do
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
