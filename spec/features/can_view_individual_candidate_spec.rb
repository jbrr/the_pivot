require "rails_helper"

feature "Can view individual candidate" do
  scenario "as a visitor" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")

    visit candidates_path
    expect(current_path).to eq("/candidates")

    click_link "Donald Trump"
    expect(current_path).to eq("/candidates/#{candidate.id}")

    expect(page).to have_content("Trump")
    expect(page).to have_content("Luxurious")

    within("#stances") do
      expect(page).to have_content("Gun Control")
      expect(page).to have_content("No thanks.")
      expect(page).to have_button("Donate")
    end
  end

  scenario "visitor views another candidate" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidates_path
    expect(current_path).to eq("/candidates")

    click_link "Ted Cruz"
    expect(current_path).to eq("/candidates/#{candidate.id}")

    expect(page).to have_content("Cruz")
    expect(page).to have_content("Kim")

    within("#stances") do
      expect(page).to have_content("Gun Control")
      expect(page).to have_content("Give them the guns!")
      expect(page).to have_button("Donate")
    end
  end
end
