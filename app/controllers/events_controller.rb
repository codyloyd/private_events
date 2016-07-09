class EventsController < ApplicationController
  def new
    @event = current_user.events_created.new
  end

  def create
    event = current_user.events_created.build
    event.title = params[:event][:title]
    event.description = params[:event][:description]
    event.location = params[:event][:location]
    event.date = params[:event][:date]
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
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end
end
