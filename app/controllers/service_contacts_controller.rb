class ServiceContactsController < ApplicationController
  
  def new
    @user = current_user
    @service_contact = ServiceContact.new
  end

  def create
    @user = current_user
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
    @user = current_user
    @service_contact = @user.service_contact
  end

  def update
    @service_contact = current_resource
    if @service_contact.update(sc_params)
      flash.notice = "Successfully edited contact details"
      redirect_to user_path(params[:user_id])
    else
      render "edit"
    end
  end

  private

  def current_resource
    @current_resource = ServiceContact.find(params[:id]) if params[:id]
  end

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
