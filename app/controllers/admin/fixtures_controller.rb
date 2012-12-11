# encoding: utf-8

class Admin::FixturesController < Admin::BaseController

  def index
  end
  
  def create
    event = Event.find( params[:event_id] )
    text  = params[:text] 
    render :text => "hello fixtures for event #{event.key}  >>#{text}<<"
  end
  
end
