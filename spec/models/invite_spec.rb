require 'spec_helper'

describe Invite do
  before(:each) do
    @user = create(:user)
  end

  # PT ID 63948792
  it "As a Consumer I want to be able to send people an Invite via email so they too can be consumers." do
    mail = InviteMailer.invite_email(@user.id, "testinvitee@blergh.com")
    mail.to.should include "testinvitee@blergh.com"
    mail.body.should include "You have been invited by #{@user.first_name}"
    mail.body.should include new_user_path
  end
  
end
