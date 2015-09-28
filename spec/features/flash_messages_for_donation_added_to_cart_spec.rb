require "rails_helper"
feature "Add donation to cart" do

  scenario "as guest flash message displays to confirm" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)

    within("#stances") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    within("#flash_messages") do
      expect(page).to have_content("Donation added to cart.")
    end
  end

  scenario "as guest flash message displays to reject empty donation" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)

    within("#stances") do
      fill_in "Amount", with: ""
      click_button "Donate"
    end

    within("#flash_messages") do
      expect(page).to have_content("Invalid Donation.")
    end
  end
end
