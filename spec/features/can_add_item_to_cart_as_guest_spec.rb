require "rails_helper"

feature "Add donation to cart" do
  scenario "as guest and view on cart page" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)
    within("#stances") do
      fill_in "Amount", with: 100
      click_button "Donate"
    end
    within("#cart") do
      click_link "Cart"
    end
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("100")
  end
end
