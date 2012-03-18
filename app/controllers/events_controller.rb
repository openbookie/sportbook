# encoding: utf-8

class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end
  
  # POST /events
  def create
    @event = Event.find( params[:id] )
    
    if @event.update_attributes(params[:event])
      redirect_to events_path(), notice: 'Veranstaltung erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end
  
  
  # GET /events/1/edit
  def edit
    @event = Event.find( params[:id] )  
  end
  
  # PUT /events/1
  def update
    @event = Event.find( params[:id] )
    
    if @event.update_attributes(params[:event])
      redirect_to events_path(), notice: 'Veranstaltung erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end
  
  # POST /events/1/add_team_to
  def add_team_to    # rename to add_team or similar?
    event = Event.find( params[:id] )
    team  = Team.find( params[:team_id] )

    event.teams << team    
    
    redirect_to events_path(), :notice => 'Team erfolgreich hinzugefügt.'     
  end

end # class EventsController