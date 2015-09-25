require "rails_helper"

feature "Can view top candidates and issues images" do
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

feature "Can view top candidates and issues links" do
  scenario "as a visitor" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "ISIS", description: "Guns Guns Guns!", featured: true)
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")

    visit root_path
    expect(current_path).to eq("/")

    within("#candidate-front-title") do
      click_link "#{candidate.name}"
    end

    expect(current_path).to eq("/candidates/#{candidate.id}")
  end

  scenario "as a visitor" do
    candidate = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxurious", featured: true, last_name: "trump")
    issue = Issue.create(topic: "ISIS", description: "Guns Guns Guns!", featured: true)
    CandidateIssue.create(candidate: candidate, issue: issue, stance: "No thanks.")

    visit root_path
    expect(current_path).to eq("/")

    within("#issue-front-title") do
      click_link "#{issue.topic}"
    end

    expect(current_path).to eq("/issues/#{issue.id}")
  end
end








