# encoding: utf-8

class LiveController < ApplicationController

  def index
    
    limit = params[:limit] || '4'
    
    if params[:past]
      @games = Game.order( 'play_at').limit( limit )
    else
      # find next upcoming games
      @games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit( limit )
    end

    @show_tips = (params[:tips].nil? == false)
    
  end
  
  def show
    @game =  Game.find( params[:game_id] )
  end
    
end # class LiveController

