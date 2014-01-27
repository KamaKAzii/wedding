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
    add_job
  end

  # PT ID 63948792
  scenario "As a Consumer I want to be able to send people an Invite via email so they too can be Consumers." do
    user = create(:user, user_type: 0)
    login_user(user)
    click_on("Invite via email")
    page.should have_content("Invite via email")
    fill_in "Email", with: "potentialpartner@blergh.com"
    click_on "Invite"
    page.should have_content "potentialpartner@blergh.com has been invited via email"
  end

  # PT ID 64217898
  scenario "As a Consumer I want to be able to add Tags to my Jobs." do
    user = create(:user, user_type: 0)
    login_user(user)
    add_marriage
    add_job
    edit_job("Attire, Dress")
  end

end
