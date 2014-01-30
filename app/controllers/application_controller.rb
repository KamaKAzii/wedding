class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorised?

  def authorise
    if current_user.nil?
      flash.alert = "Please sign in"
      redirect_to login_url
    end
  end

  private

  def authorised?
    redirect_to new_session_path unless session[:user_id]
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  helper_method :current_user

end
