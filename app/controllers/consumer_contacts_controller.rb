class ConsumerContactsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @consumer_contact = ConsumerContact.new
  end

  def create
    @user = User.find(params[:user_id])
    @consumer_contact = ConsumerContact.new(cc_params)
    @user.consumer_contact = @consumer_contact
    if @consumer_contact.save
      flash.notice = "Successfully added contact details"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @consumer_contact = @user.consumer_contact
  end

  def update
    @consumer_contact = ConsumerContact.find(params[:id])
    if @consumer_contact.update(cc_params)
      flash.notice = "Successfully edited contact details"
      redirect_to user_path(params[:user_id])
    else
      render "edit"
    end
  end

  private

  def cc_params
    params
      .require(:consumer_contact)
      .permit(
        :street_address_1,
        :street_address_2,
        :postcode,
        :phone_number,
        :gender)
  end


end
