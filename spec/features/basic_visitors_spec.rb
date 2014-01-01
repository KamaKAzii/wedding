require 'spec_helper'

feature "Basic visitors" do

  # PT ID 63043982
  scenario "As a Visitor I want to see a home page for The Wedding App." do
    visit "/"
    page.should have_content("Welcome")
  end

  # PT ID 63044014
  scenario "As a Visitor I want to sign up for an account." do
    visit "/"
    click_link "Sign up"
    page.should have_content "Sign up" 
    fill_in "First name", with: "Harry"
    fill_in "Last name", with: "Potter"
    fill_in "Email", with: "dharry.potter@gmail.com"
    fill_in "user_password", with: "abcd1234"
    fill_in "user_password_confirmation", with: "abcd1234"
    click_on "Sign up"
    page.should have_content "Successfully signed up user"
  end

  # PT ID 63253666
  scenario "As a Visitor I want to be able to sign in and keep that login for a session." do
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

end 
