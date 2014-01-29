require "spec_helper"

feature "Basic services" do

  # PT ID 63784280
  scenario "As a Service I want to be able to add Posts to a feed." do
    user = create(:user)
    login_user(user)
    add_post
  end

  # PT ID 63784212
  scenario "As a Service I want to be able to add a Gallery where I can upload photos for potential clients to see." do
    user = create(:user)
    login_user(user)
    click_on "Add photo"
    page.should have_content "Add photo"
    fill_in "Title", with: "Mad photo"
    fill_in "Description", with: "My best photo yet! Isn't it lovely?"
    attach_file "Image", "#{Rails.root}/spec/fixtures/images/service_gallery_test.png"
    click_on "Add photo"
    page.should have_content "Successfully added photo"
    page.should have_css ".photo img"
  end

  # PT ID 64217678, 64217752
  scenario "As a Service I want to manage Appointments." do
    user = create(:user)
    login_user(user)
    click_on "Add appointment"
    page.should have_content "Add appointment"
    fill_in "Title", with: "Something I had to do"
    date = Time.now + (5 * 7 * 24 * 60 * 60)
    select date.strftime("%Y").strip, from: "appointment_date_1i" # year
    select date.strftime("%B").strip, from: "appointment_date_2i" # month
    select date.strftime("%e").strip, from: "appointment_date_3i" # day
    click_on "Add appointment"
    page.should have_content "Successfully added appointment"
    page.should have_content date.strftime("%e %B %Y")
    click_on "Edit appointment"
    page.should have_content "Edit appointment"
    fill_in "Title", with: "Something new I had to do"
    date = Time.now + (8 * 7 * 24 * 60 * 60)
    select date.strftime("%Y").strip, from: "appointment_date_1i" # year
    select date.strftime("%B").strip, from: "appointment_date_2i" # month
    select date.strftime("%e").strip, from: "appointment_date_3i" # day
    click_on "Save appointment"
    page.should have_content "Successfully edited appointment"
    page.should have_content date.strftime("%e %B %Y")
  end

  # PT ID 64217922
  scenario "As a Service I want to be able to search for Jobs by Tag." do
    s_user = create(:user, email: "service@test.com")
    c_user = create(:user, email: "consumer@test.com", user_type: 0)

    visit "/"
    login_user(c_user)
    add_marriage
    add_job
    tags = "Flowers, Other"
    edit_job tags: tags
    logout_user
    visit "/"
    login_user(s_user)
    page.should have_content "Search Jobs by Tag"
    fill_in "job_tag_terms", with: tags
    click_on "Tag search"
    page.should have_content "Job search results"
    page.should have_content c_user.first_name
    page.should have_content tags
  end

  # PT ID 64217938
  scenario "As a Service I want to be able to search for Jobs as a full text search." do
    s_user = create(:user, email: "service@test.com")
    c_user = create(:user, email: "consumer@test.com", user_type: 0)

    visit "/"
    login_user(c_user)
    add_marriage
    add_job
    tags = "Flowers, Other"
    edit_job tags: tags
    logout_user
    visit "/"
    login_user(s_user)
    page.should have_content "Search Jobs by keyword"
    fill_in "job_keyword_terms", with: "Photographer"
    click_on "Keyword search"
    page.should have_content "Job search results"
    page.should have_content c_user.first_name
    page.should have_content tags
  end

  # PT ID 64720928
  scenario "As a Service I want to search by Theme and be returned a list of relevant Jobs." do
    s_user = create(:user, email: "service@test.com")
    c_user = create(:user, email: "consumer@test.com", user_type: 0)

    visit "/"
    login_user(c_user)
    add_marriage
    add_job
    tags = "Flowers, Other"
    themes = "Vintage, Sepia"
    edit_job tags: tags, themes: themes
    logout_user
    visit "/"
    login_user(s_user)
    page.should have_content "Search Jobs by Theme"
    fill_in "job_theme_terms", with: themes
    click_on "Theme search"
    page.should have_content "Job search results"
    page.should have_content c_user.first_name
    page.should have_content themes
  end

end
