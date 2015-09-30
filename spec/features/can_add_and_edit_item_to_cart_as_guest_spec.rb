require "rails_helper"

feature "Add donation to cart" do
  scenario "as guest view empty cart", js: true do
    visit cart_path

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Sorry Your Cart is Empty")
    expect(page).to have_link("View More Issues")
    expect(page).to have_link("View More Candidates")
  end

  scenario "as guest can add and view donation from candidate page", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)
    find(:css, ".donation-candidate", text: candidate_issue.topic).click
    within(".donation-time") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    within("#flash_notice") do
      expect(page).to have_content("Donation added to cart.")
    end
    within("#cart") do
      click_link "Cart"
    end
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("10")
  end

  scenario "as guest can add and view donation from issue page", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    within("#flash_notice") do
      expect(page).to have_content("Donation added to cart.")
    end

    visit cart_path
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("20")
  end

  scenario "as guest can view multiple donations in cart", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    candidate2 = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxury", last_name: "trump")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")
    candidate_issue2 = CandidateIssue.create(candidate: candidate2, issue: issue, stance: "Luxurious guns!")

    visit issue_path(issue)

    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end

    find(:css, ".donation-candidate", text: candidate_issue2.name).click
    within(".donation-time") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end

    visit cart_path
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Donald Trump")
  end

  scenario "as guest can view total donations in cart", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    candidate2 = Candidate.create(name: "Donald Trump", party: "Republican", bio: "Luxury", last_name: "trump")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")
    candidate_issue2 = CandidateIssue.create(candidate: candidate2, issue: issue, stance: "Luxurious guns!")

    visit issue_path(issue)

    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end

    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end
    within("#cart") do
      click_link "Cart"
    end

    expect(page).to have_content("70")
  end

  scenario "as guest can update donations in cart", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end

    visit cart_path
    within("#donation-table") do
      fill_in "donation[amount]", with: 10
      click_button "Update"
    end

    expect(page).to have_content("10")
  end

  scenario "as guest can delete donations from two different candidates in cart", js: true do
    candidate = Candidate.create(name: "Schmed Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Fun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    candidate2 = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue2 = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue2 = CandidateIssue.create(candidate: candidate2, issue: issue2, stance: "Give them the guns!")

    visit candidate_path(candidate)
    find(:css, ".donation-candidate", text: candidate_issue.topic).click
    within(".donation-time") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    visit candidate_path(candidate2)
    find(:css, ".donation-candidate", text: candidate_issue2.topic).click
    within(".donation-time") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end

    visit cart_path
    expect(page).to have_content("60")

    first(:link, "Remove").click

    page.accept_confirm

    within("#cart-total") do
      expect(page).to have_content("40")
    end
  end

  scenario "as guest can delete all donations in the cart and be redirected to 'Your Cart is Empty.'", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit candidate_path(candidate)
    find(:css, ".donation-candidate", text: candidate_issue.topic).click
    within(".donation-time") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    find(:css, ".donation-candidate", text: candidate_issue.topic).click
    within(".donation-time") do
      fill_in "Amount", with: 40
      click_button "Donate"
    end

    visit cart_path
    expect(page).to have_content("60")

    within("#donation-table") do
      first(:link, 'Remove').click
    end

    page.accept_confirm

    expect(page).to have_content("Sorry Your Cart is Empty")
  end

  scenario "as guest cannot update negative donations in cart", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 30
      click_button "Donate"
    end

    visit cart_path
    within("#donation-table") do
      fill_in "donation[amount]", with: -10
      click_button "Update"
    end

    within("#cart-total") do
      expect(page).to have_content("30")
    end
  end

  scenario "as guest cannot enter a negative amount", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: -20
      click_button "Donate"
    end

    visit cart_path
    expect(page).to have_content("Sorry Your Cart is Empty")
    expect(page).to have_link("View More Issues")
    expect(page).to have_link("View More Candidates")
  end

  scenario "as guest to receive a flash notice and link after removing a donation", js: true do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis", last_name: "cruz")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!", picture: "guns")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click
    within(".donation-time") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    visit cart_path

    within("#donation-table") do
      first(:link, "Remove").click
    end

    page.accept_confirm

    within("#flash_notice") do
      expect(page).to have_content("Your donation to Ted Cruz's Gun Control campaign has been removed from your cart. Click HERE to resubmit your donation")
    end
    expect(page).to have_link("HERE")
  end

  scenario "as guest can resubmit removed donation" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    within("##{candidate_issue.id}") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    visit cart_path

    within("#donation-table") do
      first(:link, "Remove").click
    end

    click_link "HERE"
    within("#donation-table") do
      first(:link, "Remove").click
      expect(page).to have_content("20")
    end
  end

  scenario "cart total is shown in navbar when donation is made" do
    candidate = Candidate.create(name: "Ted Cruz", party: "Republican", bio: "Kim Davis")
    issue = Issue.create(topic: "Gun Control", description: "Guns Guns Guns!")
    candidate_issue = CandidateIssue.create(candidate: candidate, issue: issue, stance: "Give them the guns!")

    visit issue_path(issue)
    within('#navbar') do
      expect(page).to_not have_content("Cart: $0")
    end

    within("##{candidate_issue.id}") do
      fill_in "Amount", with: 20
      click_button "Donate"
    end

    within('#navbar') do
      expect(page).to have_content("Cart: $20")
    end

    visit cart_path
    within("#donation-table") do
      first(:link, "Remove").click
    end

    within('#navbar') do
      expect(page).to have_content("Cart: $0")
    end
  end
end
