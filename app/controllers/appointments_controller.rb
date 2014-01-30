class AppointmentsController < ApplicationController

  def new
    @user = current_user
    @appointment = Appointment.new
  end

  def create
    @user = current_user
    @appointment = Appointment.new(appointment_params)
    @appointment.user = @user
    if @appointment.save
      flash.notice = "Successfully added appointment"
      redirect_to user_path(params[:user_id])
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    @appointment = current_resource
  end

  def update
    @appointment = current_resource
    if @appointment.update(appointment_params)
      flash.notice = "Successfully edited appointment" 
      redirect_to user_path(params[:user_id])
    else
      render "edit"
    end
  end

  private

  def current_resource
    @current_resource = Appointment.find(params[:id]) if params[:id]
  end

  def appointment_params
    params
      .require(:appointment)
      .permit(
        :title,
        "date(3i)",
        "date(2i)",
        "date(1i)")
  end

end
