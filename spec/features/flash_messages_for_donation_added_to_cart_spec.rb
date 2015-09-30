require "rails_helper"
feature "Add donation to cart" do

  scenario "as guest flash message displays to confirm" do
    test_setup

    visit candidate_path(candidate)

    within("#stances") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    within("#flash_notice") do
      expect(page).to have_content("Donation added to cart.")
    end
  end

  scenario "as guest flash message displays to reject empty donation" do
    test_setup

    visit candidate_path(candidate)

    within("#stances") do
      fill_in "Amount", with: ""
      click_button "Donate"
    end

    within("#flash_notice") do
      expect(page).to have_content("Invalid Donation.")
    end
  end
end
