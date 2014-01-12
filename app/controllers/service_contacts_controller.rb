class ServiceContactsController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @service_contact = ServiceContact.new
  end

  def create
    @user = User.find(params[:user_id])
    @service_contact = ServiceContact.new(sc_params)
    @user.service_contact = @service_contact
    if @service_contact.save
      flash.notice = "Successfully added contact details"
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @service_contact = @user.service_contact
  end

  def update
    @service_contact = ServiceContact.find(params[:id])
    if @service_contact.update(sc_params)
      flash.notice = "Successfully edited contact details"
      redirect_to user_path(params[:user_id])
    else
      render "edit"
    end
  end

  private

  def sc_params
    params  
      .require(:service_contact)
      .permit(
        :business_name,
        :street_address_1,
        :street_address_2,
        :postcode,
        :landline_number,
        :mobile_number,
        :fax_number,
        :website,
        :email)
  end

end
