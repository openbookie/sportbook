# encoding: utf-8

class Db::EventsController < Db::BaseController

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
    @event = Event.find( params[:id] )
  end
  
end # class EventsController