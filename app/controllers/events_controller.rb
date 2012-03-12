class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.all
  end

end # class EventsController

