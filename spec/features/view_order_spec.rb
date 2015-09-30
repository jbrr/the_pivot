require "rails_helper"

feature "can view profile page via link on order show page" do

  before do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
  end

  scenario "user clicks profile link" do
    test_setup

    visit order_path(order)

    within("#profile-button") do
      expect(page).to have_content("View Profile")
    end

    click_on "View Profile"

    expect(current_path).to eq(profile_path)
  end

  scenario "profile displays orders" do
    test_setup
    donation = Donation.create(amount: 100,
                   candidate_issue_id: candidate_issue.id,
                              user_id: user.id,
                             order_id: order.id)

    visit profile_path(user)

    within("#completed-orders") do
      expect(page).to have_content(order.created_at.strftime("%B %d, %Y"))
      expect(page).to have_content("100")
    end

    click_link "#{order.id}"
    expect(current_path).to eq(order_path(order))
  end

end
