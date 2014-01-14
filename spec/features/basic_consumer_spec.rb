require 'spec_helper'

feature "Basic consumers" do
  
  # PT ID 63782910
  scenario "As a Consumer I want to be able to add a Marriage." do 
    user = create(:user, user_type: 0)
    login_user(user)
    page.should have_content "Dashboard"
    click_on "Add marriage"
    fill_in "Title", with: "Awesome marriage"
    click_on "Add marriage"
    page.should have_content "Successfully added marriage"
    page.should have_content "Awesome marriage"
  end

end
