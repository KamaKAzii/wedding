require "spec_helper"

feature "Basic consumers" do
  
  # PT ID 63782910
  scenario "As a Consumer I want to be able to add a Marriage." do 
    user = create(:user, user_type: 0)
    login_user(user)
    page.should have_content "Dashboard"
    add_marriage
  end

  # PT ID 63783568
  scenario "As a Consumer I want to assign two different existing Users as each of the partner." do
    user = create(:user, user_type: 0)
    second_user = create(:user,
      user_type: 0, 
      email: "hermionie@luvergurlll.com",
      first_name: "Hermionie")
    login_user(user)
    add_marriage
    click_on "Edit marriage" # TODO: Click the link inside the marriage UL's first LI
    select user.first_name, from: "Users"
    select second_user.first_name, from: "Users"
    click_on "Save marriage"
    page.should have_content "Successfully edited marriage"
    page.should have_content user.first_name
    page.should have_content second_user.first_name
  end

  # PT ID 63783856
  scenario "As a Consumer I want to add Events to my Marriage." do
    user = create(:user, user_type: 0)
    login_user(user)
    add_marriage
    add_event
  end

  # PT ID 63949288
  scenario "As a Consumer I want to be able to place an Job which is attached to a Marriage." do
    user = create(:user, user_type: 0)
    login_user(user)
    add_marriage
    click_on "Add job"
    page.should have_content "Add job"
    fill_in "Title", with: "Photographer needed"
    fill_in "Description", with: "Need a super 1337 boss photographer.
      Must be vintage and hipster.
      Needs at least 10 billion years of experience. Herp."
    app_due_date = Time.now + (2 * 7 * 24 * 60 * 60) # 2 weeks
    select app_due_date.strftime("%Y"), from: "job_application_due_date_1i" # year
    select app_due_date.strftime("%B"), from: "job_application_due_date_2i" # month
    select app_due_date.strftime("%e"), from: "job_application_due_date_3i" # day
    click_on "Add job"
    page.should have_content "Job successfully added"
    page.should have_content "Photographer needed"
  end

end
