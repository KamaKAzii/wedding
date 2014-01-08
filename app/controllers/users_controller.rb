class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "Successfully signed up user"
    else
      render "new"
    end
  end

  def show
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :email, 
        :first_name,
        :last_name,
        :user_type,
        :password,
        :password_confirmation)
  end

end
