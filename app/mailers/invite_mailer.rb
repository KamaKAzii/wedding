class InviteMailer < ActionMailer::Base
  default from: "invites@weddingsapp-test.com"

  def invite_email(inviter_user_id, invitee_email)
    @user = User.find(inviter_user_id)
    mail to: invitee_email, subject: "You've been invited!"
  end
  
end
