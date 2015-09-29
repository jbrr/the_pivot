require "rails_helper"

feature "can create order as user" do

  scenario "register user can create an order", js: true do

    user = User.create(first_name: "Donald",
                       last_name: "Trump",
                       email: "trump@luxury.com",
                       username: "therealtrump",
                       password: "password",
                       password_confirmation: "password")

    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit candidate_path(candidate)

    find(:css, ".donation-candidate", text: candidate_issue.topic).click

    within(".donation-time") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    visit issue_path(issue)

    find(:css, ".donation-candidate", text: candidate_issue.name).click

    within(".donation-time") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    within("#cart") do
      click_link "Cart"
    end

    expect(page).to have_content("20")

    within("#cart-donate-button") do
      click_button "DONATE"
    end
    order = Order.find(1)

    expect(current_path).to eq(order_path(order.id))
    expect(page).to have_content("20")
    expect(page).to have_content("Donald")
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("Order Number: #{order.id}")
  end
end
