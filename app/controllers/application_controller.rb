class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorise

  def current_resource
    nil
  end

  private


  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorise
    if !current_permission.allow?(params[:controller], params[:action], current_resource)
      redirect_to new_session_path
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  helper_method :current_user

end
