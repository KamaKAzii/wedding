require 'spec_helper'

feature "Basic visitors" do

  # PT ID 63043982
  scenario "As a Visitor I want to see a home page for The Wedding App." do
    visit "/"
    page.should have_content("Welcome")
  end

  # PT ID 63044014, 63123254
  scenario "As a Visitor I want to sign up for an account as a Consumer.
  As a Visitor I want to be signed in automatically when I sign up as a Consumer." do
    consumer_sign_up
  end

  # PT ID 63365394
  scenario "As a Visitor I want to sign up as a Service." do
    service_sign_up
  end

  # PT ID 63253666
  scenario "As a User I want to be able to sign in and keep that login for a session." do
    user = create(:user)
    visit "/"
    click_link "Log in"
    page.should have_content "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "abcd1234"
    click_on "Log in"
    page.should have_content "Successfully signed in"
    page.should have_content "Signed in as #{user.first_name} #{user.last_name}"
  end

  # PT ID 63442058
  scenario "As a User I want to be able to log out." do
    consumer_sign_up
    click_on "Log out"
    page.should have_content  "Successfully signed out"
  end

  # PT ID 63445262
  scenario "As a User I want to see a dashboard with user details." do
    consumer_sign_up
    page.should have_content "Dashboard"
  end

  # PT ID 63520586
  scenario "As a Consumer I want to be able to view, add and edit my contact details from my dashboard." do
    consumer_sign_up
    page.should have_content "Dashboard"

    # Add details
    click_on "Add contact"
    page.should have_content "Add contact"
    fill_in "Street address 1", with: "Apt 30"
    fill_in "Street address 2", with: "20 Old Street"
    fill_in "Postcode", with: "0235"
    fill_in "Phone number", with: "0123445631"
    select "Male", from: "Gender"
    click_on "Add contact"
    page.should have_content "Successfully added contact details"
    page.should have_content "Apt 30"
    page.should have_content "20 Old Street"
    page.should have_content "0235"
    page.should have_content "0123445631"
    page.should have_content "1"

    # Edit details
    click_on "Edit contact"
    fill_in "Street address 1", with: "Apt 40"
    fill_in "Street address 2", with: "20 New Lane"
    fill_in "Postcode", with: "4323"
    fill_in "Phone number", with: "9012345678"
    select "Female", from: "Gender"
    click_on "Save contact"
    page.should have_content "Successfully edited contact details"
    page.should have_content "Apt 40"
    page.should have_content "20 New Lane"
    page.should have_content "4323"
    page.should have_content "9012345678"
    page.should have_content "0"
  end

end 
