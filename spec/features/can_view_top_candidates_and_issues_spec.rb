require "rails_helper"

feature "Can view top candidates" do
  scenario "as a visitor" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")

    visit root_path
    expect(current_path).to eq("/")

    within("#candidate-#{candidate.id}") do
      find(:xpath, "//a/img[@alt='Trump']/..").click
    end

    expect(current_path).to eq("/candidates/#{candidate.id}")
  end


  scenario "as a visitor" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "ISIS", description: "Guns Guns Guns!", featured: true)
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")

    visit root_path
    expect(current_path).to eq("/")

    within("#issue-#{issue.id}") do
      find(:xpath, "//a/img[@alt='Isis']/..").click
    end

    expect(current_path).to eq("/issues/#{issue.id}")
  end
end