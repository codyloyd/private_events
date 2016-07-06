class EventAttendingsController < ApplicationController
  def create
    event = Event.find(params[:format])
    if user = current_user
      user.event_attendings.create(event: event)
    end
    redirect_to event
  end
end
