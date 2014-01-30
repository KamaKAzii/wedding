class ConsumerContactsController < ApplicationController

  def new
    @user = current_user
    @consumer_contact = ConsumerContact.new
  end

  def create
    @user = current_user
    @consumer_contact = ConsumerContact.new(cc_params)
    @consumer_contact.user = @user
    if @consumer_contact.save
      flash.notice = "Successfully added contact details"
      redirect_to user_path(current_user.id)
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    @consumer_contact = @user.consumer_contact
  end

  def update
    @consumer_contact = current_resource
    if @consumer_contact.update(cc_params)
      flash.notice = "Successfully edited contact details"
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  private

  def current_resource
    @current_resource = ConsumerContact.find(params[:id]) if params[:id]
  end

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
