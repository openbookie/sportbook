# encoding: utf-8

class LiveController < ApplicationController

  def index
    
    limit = params[:limit] || '4'
    
    if params[:past].present? && ['1','t','true','yes', 'on'].include?( params[:past] )
      # find last past games
      @games = Game.where( 'play_at < ?', Time.now).order( 'play_at desc').limit( limit )
    else
      # find next upcoming games
      @games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit( limit )
    end

    @show_tips = (params[:tips].present? && ['1','t','true','yes', 'on'].include?( params[:tips] ))
  end
  
  def show
    @game =  Game.find( params[:game_id] )
  end
    
end # class LiveController

