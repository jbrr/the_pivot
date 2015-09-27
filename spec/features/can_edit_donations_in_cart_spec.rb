require "rails_helper"

feature "Edit donations in cart" do
  scenario "as guest can edit donations in cart", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end

    visit cart_path
    within("#donation-table") do
      fill_in "donation[amount]", with: 10
      click_button "Update"
    end

    expect(page).to have_content("10")
  end
  
  scenario "as guest cannot edit negative donations in cart", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end

    visit cart_path
    within("#donation-table") do
      fill_in "donation[amount]", with: -10
      click_button "Update"
    end
    within("#flash_notice") do
      expect(page).to have_content("Donation must be greater than 0.")
    end
  end
end
