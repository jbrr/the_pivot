require "rails_helper"

feature "Delete donations from cart" do
  scenario "as guest can delete donations from two different candidates in cart" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    candidate2 = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue2 = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue2 = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)

    within("#candidate_issue-#{candidate_issue.id}") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    within("#candidate_issue-#{candidate_issue2.id}") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end

    within("#cart") do
      click_link "Cart"
    end
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("60")


    first(:link, 'Remove').click

    within("#cart-total") do
      expect(page).to have_content("40")
    end
  end

  scenario "as guest can delete all donations in the cart and be redirected to 'Your Cart is Empty.'" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)

    within("#candidate_issue-#{candidate_issue.id}") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    within("#candidate_issue-#{candidate_issue.id}") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end

    within("#cart") do
      click_link "Cart"
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("60")

    within("#donation-table") do
      first(:link, 'Remove').click
    end

    expect(page).to have_content("Your cart is empty.")
  end
end
