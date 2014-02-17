# encoding: utf-8

class Admin::FixturesController < Admin::BaseController

  def index
  end

  def create
    event = Event.find( params[:event_id] )
    text  = params[:text]

    puts "[FixturesController] event_id=#{params[:event_id]}, event.key=#{event.key}"
    puts "   text=#{text}"

    puts "   before SportDb::Reader.new"
    reader = SportDb::Reader.new( './dummy/path' )   ### fix: no path required for string reader ??
    
    puts "   after SportDb::Reader.new"
    puts "   before load_from_string"
    reader.load_fixtures_from_string( event.key, text )
    puts "   after load_from_string"

    render :text => "done; hello fixtures for event #{event.key}  >>#{text}<<"
  end
  
end

