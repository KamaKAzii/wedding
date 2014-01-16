require "spec_helper"

feature "Basic services" do

  # PT ID63784280
  scenario "As a Service I want to be able to add Posts to a feed." do
    user = create(:user)
    login_user(user)
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

end
