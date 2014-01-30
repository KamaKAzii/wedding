class PhotosController < ApplicationController
  
  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    @user = current_user
    @photo = Photo.new(photo_params)
    @photo.user = @user
    if @photo.save
      flash.notice = "Successfully added photo"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  private

  def photo_params
    params
      .require(:photo)
      .permit(
        :title,
        :description,
        :image)
  end

end
