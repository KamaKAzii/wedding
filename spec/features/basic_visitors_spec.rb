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

  # PT ID 63365394, 64721002
  scenario "As a Visitor I want to sign up as a Service." do
    service_sign_up "Gold"
  end

  # PT ID 63253666
  scenario "As a User I want to be able to sign in and keep that login for a session." do
    user = create(:user)
    login_user(user)
    page.should have_content "Successfully logged in"
    page.should have_content "Signed in as #{user.first_name} #{user.last_name}"
  end

  # PT ID 63442058
  scenario "As a User I want to be able to log out." do
    consumer_sign_up
    click_on "Log out"
    page.should have_content  "Successfully logged out"
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

  # PT ID 63581632
  scenario "As a Service I want to be able to view, add and edit my contact details from my dashboard." do
    service_sign_up "Gold"
    page.should have_content "Dashboard"

    # Add details
    click_on "Add contact"
    page.should have_content "Add contact"
    fill_in "Business name", with: "Potter Pottery"
    fill_in "Street address 1", with: "Suite 1"
    fill_in "Street address 2", with: "35 Old Street"
    fill_in "Postcode", with: "1324"
    fill_in "Landline number", with: "0123445631"
    fill_in "Mobile number", with: "0412334123"
    fill_in "Fax number", with: "0311234566"
    fill_in "Website", with: "www.potterpottery.com"
    fill_in "Email", with: "mail@potterpottery.com"
    click_on "Add contact"
    page.should have_content "Successfully added contact details"
    page.should have_content "Potter Pottery"
    page.should have_content "35 Old Street"
    page.should have_content "1324"
    page.should have_content "0123445631"
    page.should have_content "0412334123"
    page.should have_content "0311234566"
    page.should have_content "www.potterpottery.com"
    page.should have_content "mail@potterpottery.com"

    # Edit details
    click_on "Edit contact"
    fill_in "Street address 1", with: "Suite 4"
    fill_in "Email", with: "contact@potterpottery.com"
    click_on "Save contact"
    page.should have_content "Successfully edited contact details"
    page.should have_content "Suite 4"
    page.should have_content "contact@potterpottery.com"
  end 

  # PT ID 63783614
  scenario "As a Visitor I only want to be able to sign up if my email address is unique." do
    user = create(:user)
    visit "/"
    click_link "Sign up"
    page.should have_content "Sign up" 
    fill_in "First name", with: "Harry"
    fill_in "Last name", with: "Potter"
    fill_in "Email", with: user.email
    fill_in "user_password", with: "abcd1234"
    fill_in "user_password_confirmation", with: "abcd1234"
    select "Consumer", from: "User type"
    click_on "Sign up"
    page.should have_content "Sign up" 
    page.should have_content "That email has been taken"
  end

end 
