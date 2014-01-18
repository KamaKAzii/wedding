class InvitesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @invite = Invite.new
  end

  def create
    @user = User.find(params[:user_id])
    @invite = Invite.new(invite_params)
    if @invite.save
      InviteMailer.invite_email(@user.id, @invite.email)
      flash.notice = "#{@invite.email} has been invited via email"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  private

  def invite_params
    params
      .require(:invite)
      .permit(
        :email)
  end

end
