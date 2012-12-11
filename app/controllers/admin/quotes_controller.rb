# encoding: utf-8

class Admin::QuotesController < Admin::BaseController

  def index
  end
  
 def create
    event = Event.find( params[:event_id] )
    text  = params[:text] 
    render :text => "hello quotes for event #{event.key} >>#{text}<<"
  end  
  
end
