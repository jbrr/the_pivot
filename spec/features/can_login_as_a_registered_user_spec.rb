require "rails_helper"

feature "Can log in as a registered user" do

  scenario "registered user logs in" do
    user = User.create(first_name: "Donald",
                            last_name: "Trump",
                            email: "trump@luxury.com",
                            username: "therealtrump",
                            password: "password",
                            password_confirmation: "password")


    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    within("#user_names") do
      expect(page).to have_content("Donald Trump")
    end

    within("#navbar-flash") do
      expect(page).to_not have_content("Login")
      expect(page).to_not have_content("Join")
      expect(page).to have_content("Logout")
    end
  end

  scenario "unregistered cannot log in" do
    visit login_path

    fill_in "Username", with: "Donald"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Invalid Login")
    expect(page).to_not have_content("Donald Trump")
  end

  scenario "registered user logs in via nav bar button" do
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
    expect(current_path).to eq(login_path)

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    within("#user_names") do
      expect(page).to have_content("Donald Trump")
    end
  end

  scenario "link to create account exists on login form" do
    visit login_path
    within("#login-form") do
      expect(page).to have_link("Not registered? Sign up here.")
    end
    click_link "Not registered? Sign up here."
    expect(current_path).to eq(join_path)
  end

  scenario "link to login form exists on create account" do
    visit join_path
    within("#join-form") do
      expect(page).to have_link("Already registered? Click here to log in.")
    end
    click_link "Already registered? Click here to log in."
    expect(current_path).to eq(login_path)
  end

end
