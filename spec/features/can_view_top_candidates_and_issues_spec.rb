require "rails_helper"

feature "Can view and click to see top candidates and issues" do
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
      expect(page).to have_content("Isis")
    end
  end

  scenario "can visit a specific featured candidate from their image" do
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
      find(:xpath, "//a/img[@alt='.jpg']/..").click
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

  scenario "can use buttons at bottom to access the issues and candidates pages" do
    visit root_path
    within("#button-front-page") do
      click_link "Browse All 2016 Candidates"
    end

    expect(current_path).to eq("/candidates")

    visit root_path
    within("#button-front-page") do
      click_link "Browse All 2016 Issues"
    end

    expect(current_path).to eq("/issues")
  end

  scenario "can use button to login at the botton of the page" do
    visit root_path

    within("#login-button") do
      click_link "Login"
    end

    expect(current_path).to eq("/login")
  end
end
