class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.notice = "Successfully signed up user."
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user = current_resource
  end

  private

  def current_resource
    @current_resource = User.find(params[:id]) if params[:id]
  end

  def user_params
    params
      .require(:user)
      .permit(
        :email, 
        :first_name,
        :last_name,
        :user_type,
        :plan,
        :password,
        :password_confirmation)
  end

end
