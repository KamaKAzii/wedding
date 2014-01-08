class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash.notice = "Successfully signed in"
      redirect_to root_url
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = "Successfully signed out"
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
