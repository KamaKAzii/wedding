def consumer_sign_up
  visit "/"
  click_link "Sign up"
  page.should have_content "Sign up" 
  fill_in "First name", with: "Harry"
  fill_in "Last name", with: "Potter"
  fill_in "Email", with: "dharry.potter@gmail.com"
  fill_in "user_password", with: "abcd1234"
  fill_in "user_password_confirmation", with: "abcd1234"
  select "Consumer", from: "User type"
  click_on "Sign up"
  page.should have_content "Successfully signed up user"
  page.should have_content "Signed in as Harry Potter"
end

def service_sign_up
  visit "/"
  click_link "Sign up"
  page.should have_content "Sign up" 
  fill_in "First name", with: "Harry"
  fill_in "Last name", with: "Potter"
  fill_in "Email", with: "dharry.potter@gmail.com"
  fill_in "user_password", with: "abcd1234"
  select "Service", from: "User type"
  fill_in "user_password_confirmation", with: "abcd1234"
  click_on "Sign up"
  page.should have_content "Successfully signed up user"
  page.should have_content "Signed in as Harry Potter"
end

def login_user(user)
    visit "/"
    click_link "Log in"
    page.should have_content "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
end
