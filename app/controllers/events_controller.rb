class EventsController < ApplicationController
  
  def new
    @marriage = Marriage.joins(:user).where(["user_id = ?", current_user.id]).last
    @event = Event.new
  end

  def create
    @marriage = Marriage.joins(:user).where(["user_id = ?", current_user.id]).last
    @event = Event.new(event_params)
    @event.marriage = @marriage
    if @event.save
      flash.notice = "Successfully added event"
      if current_user
        redirect_to user_path(current_user.id)
      else
        redirect_to root_path
      end
    else
      render "new"
    end
  end

  private

  def event_params
    params
      .require(:event)
      .permit(
        :title,
        :street_address_1,
        :street_address_2,
        :postcode,
        "date(3i)",
        "date(2i)",
        "date(1i)")
  end

end
