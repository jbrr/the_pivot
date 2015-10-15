require "rails_helper"

feature "A logged in Admin" do
  scenario "can edit candidate bio" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/ted-cruz"
    click_on "Stances"
    fill_in "candidate[bio]", with: "Dim Kavis"
    click_on "Update Bio"

    expect(page).to have_content("Bio Successfully Updated")

    visit "/candidates"
    click_on "Ted Cruz"
    expect(page).to have_content("Dim Kavis")
  end

  scenario "cannot edit candidate bio with invalid attributes" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/ted-cruz"
    click_on "Stances"
    fill_in "candidate[bio]", with: ""
    click_on "Update Bio"

    expect(page).to have_content("Do you even American Bro?")
  end

  scenario "can edit candidate stance" do
    test_setup

    visit root_path

    within("#login-button") do
      click_link "Login"
    end
    expect(current_path).to eq(login_path)

    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/admin/ted-cruz"
    click_on "Stances"
    first(".edit_candidate_issue").fill_in "candidate_issue[stance]",
                                           with: "No opinion"
    click_on "Update Stance"

    expect(page).to have_content("Stance Successfully Updated")

    visit "/candidates"
    click_on "Ted Cruz"
    expect(page).to have_content("No opinion")
  end
end
