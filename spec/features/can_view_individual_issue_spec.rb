require "rails_helper"

feature "Can view individual issue" do
  scenario "as a visitor" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")

    visit issues_path
    expect(current_path).to eq("/issues")

    click_link "Gun Control"
    expect(current_path).to eq("/issues/#{issue.id}")

    expect(page).to have_content("Gun Control")
    expect(page).to have_content("Guns Guns Guns!")

    within("#stances") do
      expect(page).to have_content("Trump")
      expect(page).to have_content("No thanks.")
      expect(page).to have_button("Donate")
    end
  end

  scenario "visitor views another issue" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious")
    issue = Issue.create(topic: "Women's Rights", description: "Abortion?")
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No rights!")

    visit issues_path
    expect(current_path).to eq("/issues")

    click_link "Women's Rights"
    expect(current_path).to eq("/issues/#{issue.id}")

    expect(page).to have_content("Women's Rights")
    expect(page).to have_content("Abortion?")

    within("#stances") do
      expect(page).to have_content("Trump")
      expect(page).to have_content("No rights!")
      expect(page).to have_button("Donate")
    end
  end
end
