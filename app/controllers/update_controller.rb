# encoding: utf-8

class UpdateController < ApplicationController

  def index
    limit = params[:limit] || '30'
    
    # find last past games
    
    if params[:all].present? && ['0','f','false','no', 'off'].include?( params[:all] )
      @games = Game.where( 'play_at < ?', Time.now).where( 'score1 is null or score2 is null' ).order( 'play_at desc').limit( limit )
    else
      @games = Game.where( 'play_at < ?', Time.now).order( 'play_at desc').limit( limit )
    end
  end
  
  
  def update
     # mass update of game results
     
   # check for case w/ no games
   if params[:games]
    params[:games].each do |game_id,game_hash|
      game = Game.find( game_id )
      
      # only update if has changes (to avoid duplicate/false action item in news feed)
      
      score1 = game_hash[:score1].blank? ? nil : game_hash[:score1].to_i
      score2 = game_hash[:score2].blank? ? nil : game_hash[:score2].to_i
            
      if game.score1 != score1 || game.score2 != score2

        logger.info "*** updating game #{game_id} (#{score1}:#{score2})"

        game.score1 = score1
        game.score2 = score2
        game.save!
      else
        logger.info "*** skip updating game #{game_id} - no changes"
      end
    end
    flash[:success] = 'Spielergebnisse erfolgreich gespeichert.'
   end
  
    redirect_to update_path()
  end
    
end # class UpdateController