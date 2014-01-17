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

end
