class MarriagesController < ApplicationController
  
  def new
    @user = current_user
    @marriage = Marriage.new
  end

  def create
    @user = current_user
    @marriage = Marriage.new(marriage_params)
    @marriage.couple = Couple.new
    @marriage.user = @user
    if @marriage.save
      flash.notice = "Successfully added marriage"
      redirect_to user_path(current_user.id)
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    @marriage = current_resource
  end

  def update
    @marriage = current_resource
    if @marriage.update(marriage_params)
      flash.notice = "Successfully edited marriage"
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end
  
  private

  def current_resource
    @current_resource = Marriage.find(params[:id]) if params[:id]
  end

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
