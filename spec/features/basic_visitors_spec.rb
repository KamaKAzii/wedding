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

end 
