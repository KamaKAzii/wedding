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

def add_marriage
  click_on "Add marriage"
  fill_in "Title", with: "Super cool marriage"
  click_on "Add marriage"
  page.should have_content "Successfully added marriage"
  page.should have_content "Super cool marriage"
end

def add_event
  click_on "Add event"
  page.should have_content "Add event"
  fill_in "Title", with: "Ceremony"
  fill_in "Street address 1", with: "1 Church Street"
  fill_in "Postcode", with: "0123"
  select Time.now.strftime("%Y"), from: "event_date_1i" # year
  select Time.now.strftime("%B"), from: "event_date_2i" # month
  select Time.now.strftime("%e"), from: "event_date_3i" # day
  click_on "Add event"
  page.should have_content "Successfully added event"
  page.should have_content "Ceremony"
  page.should have_content "1 Church Street"
end

def add_post
  click_on "Add post"
  page.should have_content "Add post"
  fill_in "Title", with: "First service blog post"
  fill_in "Body", with: "This is the body of the first post.
    What a great day for weddings.
    Isn't it a lovely day. Derp."
  click_on "Add post"
  page.should have_content "Successfully added post"
  page.should have_content "First service blog post"
  page.should have_content "This is the body of the first post."
end

def add_job
  click_on "Add job"
  page.should have_content "Add job"
  fill_in "Title", with: "Photographer needed"
  fill_in "Description", with: "Need a super 1337 boss photographer.
    Must be vintage and hipster.
    Needs at least 10 billion years of experience. Herp."
  app_due_date = Time.now + (2 * 7 * 24 * 60 * 60) # 2 weeks
  select app_due_date.strftime("%Y").strip, from: "job_application_due_date_1i" # year
  select app_due_date.strftime("%B").strip, from: "job_application_due_date_2i" # month
  select app_due_date.strftime("%e").strip, from: "job_application_due_date_3i" # day
  click_on "Add job"
  page.should have_content "Job successfully added"
  page.should have_content "Photographer needed"
end
