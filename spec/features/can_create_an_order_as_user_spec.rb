require "rails_helper"

feature "can create order as user" do
  scenario "register user can create an order", js: true do
    test_setup

    # allow_any_instance_of(ApplicationController).
    #   to receive(:current_user).and_return(user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit candidate_path(candidate)
    find(:css, ".donation-candidate", text: candidate_issue.topic).click

    within(".donation-time") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    visit issue_path(issue)
    find(:css, ".donation-candidate", text: candidate_issue.name).click

    within(".donation-time") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    within("#cart") do
      click_link "Cart"
    end

    expect(page).to have_content("20")

    within("#cart-donate-button") do
      click_button "Pay with Card"
    end

    sleep(2)
    stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    Capybara.within_frame stripe_iframe do
      page.execute_script(%Q{ $('input#email').val('jamesdd9302@yahoo.com'); })
        page.execute_script(%Q{ $('input#card_number').val('4242424242424242'); })
        page.execute_script(%Q{ $('input#cc-exp').val('08/44'); })
        page.execute_script(%Q{ $('input#cc-csc').val('999'); })
        page.execute_script(%Q{ $('#submitButton').click(); })
      sleep(10)
    end

    order = Order.find(1)

    expect(current_path).to eq(order_path(order.id))
    expect(page).to have_content("20")
    expect(page).to have_content("Donald")
    expect(page).to have_content("Ted Cruz")
    expect(page).to have_content("Gun Control")
    expect(page).to have_content("Order Number: #{order.id}")
  end
end
