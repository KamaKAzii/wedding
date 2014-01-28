class AppointmentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @appointment = Appointment.new
  end

  def create
    @user = User.find(params[:user_id])
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
    @user = User.find(params[:user_id])
    @appointment = Appointment.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      flash.notice = "Successfully edited appointment" 
      redirect_to user_path(params[:user_id])
    else
      render "edit"
    end
  end

  private

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
