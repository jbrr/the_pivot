require "rails_helper"

feature "Add donation to cart" do
  scenario "as guest view empty cart" do
    visit root_path
    within("#cart") do
      click_link "Cart"
    end

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Your cart is empty.")
    expect(page).to have_button("View more issues.")
    expect(page).to have_button("View more candidates.")
  end

  scenario "as guest and view on cart page from candidate page" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)
    within("#stances") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end
    within("#cart") do
      click_link "Cart"
    end
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("10")
  end

  scenario "as guest and view on cart page from issue page" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    within("#stances") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end
    within("#cart") do
      click_link "Cart"
    end
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("20")
  end

  scenario "as guest can view multiple donations in cart" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    candidate2 = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxury")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")
    candidate_issue2 = CandidateIssue.create(candidate: candidate2, issue: issue, stance: "Luxurious guns!")

    visit issue_path(issue)
    within("##{candidate_issue.id}") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end
    within("##{candidate_issue2.id}") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end
    within("#cart") do
      click_link "Cart"
    end

    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Donald Trump")
  end

  scenario "as guest can view total donations in cart" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    candidate2 = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxury")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")
    candidate_issue2 = CandidateIssue.create(candidate: candidate2, issue: issue, stance: "Luxurious guns!")

    visit issue_path(issue)
    within("##{candidate_issue.id}") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end
    within("##{candidate_issue2.id}") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end
    within("#cart") do
      click_link "Cart"
    end

    expect(page).to have_content("70")
  end
end
