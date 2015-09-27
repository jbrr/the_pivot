require "rails_helper"

feature "Can view and use top candidates and issues images" do
  before do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "Isis", description: "Guns Guns Guns!", featured: true)
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")
  end

  scenario "as a visitor" do
    visit root_path
    expect(current_path).to eq("/")

    expect(page).to have_content("Welcome to Earmarked")
    expect(page).to have_content("Top Candidates")
    within("#candidates") do
      expect(page).to have_content("Donald Trump")
    end
    within("#issues") do
      expect(page).to have_content("ISIS")
    end
  end

  scenario "can visit a specific featured candidate from their image"
    candidate = Candidate.find_by(name: "Donald Trump")

    visit root_path
    within("#candidate-#{candidate.id}") do
      find(:xpath, "//a/img[@alt='Trump']/..").click
    end

    expect(current_path).to eq("/candidates/#{candidate.id}")
  end

  scenario "can visit a specific featured issue from its image" do
    issue = Issue.find_by(topic: "Isis")

    visit root_path
    within("#issue-#{issue.id}") do
      find(:xpath, "//a/img[@alt='Isis']/..").click
    end

    expect(current_path).to eq("/issues/#{issue.id}")
  end

  scenario "can visit a specific featured candidate from its name" do
    candidate = Candidate.find_by(name: "Donald Trump")

    visit root_path
    within("#candidate-front-title") do
      click_link "#{candidate.name}"
    end

    expect(current_path).to eq("/candidates/#{candidate.id}")
  end

  scenario "can visit a specific featured issue from its name" do
    issue = Issue.find_by(topic: "Isis")

    visit root_path
    within("#issue-front-title") do
      click_link "#{issue.topic}"
    end

    expect(current_path).to eq("/issues/#{issue.id}")
  end
end
