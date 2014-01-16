require 'spec_helper'

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

end
