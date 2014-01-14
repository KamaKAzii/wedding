class MarriagesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @marriage = Marriage.new
  end

  def create
    @user = User.find(params[:user_id])
    @marriage = Marriage.new(marriage_params)
    @marriage.couple = Couple.new
    @user.marriage = @marriage
    if @marriage.save
      flash.notice = "Successfully added marriage"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @marriage = @user.marriage
  end

  def update
    @user = User.find(params[:user_id])
    if @user.marriage.update(marriage_params)
      flash.notice = "Successfully edited marriage"
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
        :title,
        couple_attributes: [
          :id,
          user_ids: []
          ])
  end

end
