require "rails_helper"

feature "Add donation to cart" do

  scenario "as guest flash message displays to confirm" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)
    click_button "Donate"
    
  end

end
