class MarriagesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @marriage = Marriage.new
  end

  def create
    @user = User.find(params[:user_id])
    @marriage = Marriage.new(marriage_params)
    @user.marriage = @marriage
    if @marriage.save
      flash.notice = "Successfully added marriage"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  private

  def marriage_params
    params
      .require(:marriage)
      .permit(
        :title)
  end

end
