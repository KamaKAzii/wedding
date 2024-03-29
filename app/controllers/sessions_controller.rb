class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash.notice = "Successfully logged in"
      redirect_to user_path(user.id)
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    current_permission = Permission.new(current_user)
    flash.notice = "Successfully logged out"
    redirect_to root_url
  end

  private

  def session_params
    params
      .permit(
        :email,
        :password)
  end

end
