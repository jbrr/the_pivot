require "rails_helper"

feature "can view profile page via link on order show page" do

  scenario "user clicks profile link" do
    user = User.create(first_name: "Donald",
                       last_name: "Trump",
                       email: "trump@luxury.com",
                       username: "therealtrump",
                       password: "password",
                       password_confirmation: "password")

    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    order = Order.create(total: 100, user_id: user.id)

    visit order_path(order)

    within("#profile-button") do
      expect(page).to have_content("View Profile")
    end

    click_on "View Profile"

    expect(current_path).to eq(profile_path)
  end
end
