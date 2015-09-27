require "rails_helper"

feature "Can view candidates" do
  scenario "guest can see candidates list" do
    Candidate.create(name: "Donald Trump",
                    party: "Republican",
                    bio: "Luxurious")

    visit root_path
    expect(current_path).to eq("/")

    click_link "Browse All 2016 Candidates"
    expect(current_path).to eq("/candidates")

    within("#candidates") do
      expect(page).to have_content("Democrat")
      expect(page).to have_content("Trump")
    end
  end

  scenario "guest can see candidates unique pictures" do
    Candidate.create(name: "Donald Trump",
                    party: "Republican",
                    bio: "Luxurious",
                    last_name: "trump")
    Candidate.create(name: "Joe Biden",
                    party: "Democratic",
                    bio: "Whiskey",
                    last_name: "biden")
    Candidate.create(name: "Ted Cruz",
                    party: "Republican",
                    bio: "Religion",
                    last_name: "cruz")

    visit candidates_path

    within("#candidates") do
      expect(page).to have_css("#trump-image")
      expect(page).to have_css("#cruz-image")
      expect(page).to have_css("#biden-image")
    end
  end

end
