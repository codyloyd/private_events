class EventsController < ApplicationController
  def new
    @event = current_user.events_created.new
  end

  def create
    event = current_user.events_created.build
    event.title = params[:event][:title]
    event.description = params[:event][:description]
    if event.save
      redirect_to event
    else
      flash[:danger] = "uh oh"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees.all
  end

  def index
    @events = Event.all
  end
end
