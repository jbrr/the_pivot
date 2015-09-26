require "rails_helper"

feature "Can view top candidates and issues images" do
  before do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "Isis", description: "Guns Guns Guns!", featured: true)
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")
  end

  scenario "as a visitor" do
    candidate = Candidate.find_by(name: "Donald Trump")

    visit root_path
    expect(current_path).to eq("/")

    within("#candidate-#{candidate.id}") do
      find(:xpath, "//a/img[@alt='Trump']/..").click
    end

    expect(current_path).to eq("/candidates/#{candidate.id}")
  end

  scenario "as a visitor" do
    issue = Issue.find_by(topic: "Isis")

    visit root_path
    expect(current_path).to eq("/")

    within("#issue-#{issue.id}") do
      find(:xpath, "//a/img[@alt='Isis']/..").click
    end

    expect(current_path).to eq("/issues/#{issue.id}")
  end
end

feature "Can view top candidates and issues links" do
  before do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "Isis", description: "Guns Guns Guns!", featured: true)
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")
  end

  scenario "as a visitor" do
    candidate = Candidate.find_by(name: "Donald Trump")

    visit root_path
    expect(current_path).to eq("/")

    within("#candidate-front-title") do
      click_link "#{candidate.name}"
    end

    expect(current_path).to eq("/candidates/#{candidate.id}")
  end

  scenario "as a visitor" do
    issue = Issue.find_by(topic: "Isis")

    visit root_path
    expect(current_path).to eq("/")

    within("#issue-front-title") do
      click_link "#{issue.topic}"
    end

    expect(current_path).to eq("/issues/#{issue.id}")
  end
end








