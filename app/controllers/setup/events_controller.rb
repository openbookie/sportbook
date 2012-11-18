# encoding: utf-8

class Setup::EventsController < Setup::BaseController

  # GET /events
  def index
    @events = Event.all
  end

end # class EventsController