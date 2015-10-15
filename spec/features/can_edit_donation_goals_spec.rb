require "rails_helper"

feature "A logged in Admin" do
  scenario "can edit dontation goal by stance" do
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
    fill_in "candidate_issue[goal]", with: "4000"
    click_on "Update Goal"

    expect(page).to have_content("Stance Successfully Updated")

    visit "/admin/ted-cruz"
    expect(page).to have_content("4000")
  end
end
