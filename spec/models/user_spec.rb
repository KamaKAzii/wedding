require "spec_helper"

describe User do

  # PT ID 63843580
  it "As a User I want more validation when signing up." do
    # Presence of email
    user = build(:user)
    user.email = ""
    user.save
    user.should have(1).error_on(:email)
    user.email = "harrytest@test123.com"
    user.save
    user.should have(0).errors_on(:email)

    # Uniqueness of email
    second_user = build(:user, email: "harrytest@test123.com")
    second_user.save
    second_user.should have(1).errors_on(:email)
  end
  
end
