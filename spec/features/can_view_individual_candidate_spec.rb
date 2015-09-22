require "rails_helper"

feature "Can view individual candidate" do
  scenario "as a visitor" do
    Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious")
    Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    CandidateIssue.create(candidate_id: 1, issue_id: 1, stance: "No thanks.")

    visit candidates_path
    expect(current_path).to eq("/candidates")

    click_link "Donald Trump"
    expect(current_path).to eq("/candidates/1")

    expect(page).to have_content("Trump")
    expect(page).to have_content("Luxurious")

    within("#stances") do
      expect(page).to have_content("Gun Control")
      expect(page).to have_content("No thanks.")
      expect(page).to have_content("Donate")
    end
  end
end
