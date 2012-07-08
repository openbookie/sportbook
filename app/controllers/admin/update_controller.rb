# encoding: utf-8

class Admin::UpdateController < Admin::BaseController

  def index
    limit = params[:limit] || '30'
    
=begin
    if params[:all].present? && ['0','f','false','no', 'off'].include?( params[:all] )
      @games = Game.where( 'play_at < ?', Time.now).where( 'score1 is null or score2 is null' ).order( 'play_at desc').limit( limit )
    else
      @games = Game.where( 'play_at < ?', Time.now).order( 'play_at desc').limit( limit )
    end
=end

    # find next upcoming games 
    
    @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit(limit)
    @past_games     = Game.where( 'play_at < ?', Time.now ).order( 'play_at desc').limit(limit)
    
    
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
      score3 = game_hash[:score3].blank? ? nil : game_hash[:score3].to_i
      score4 = game_hash[:score4].blank? ? nil : game_hash[:score4].to_i
      score5 = game_hash[:score5].blank? ? nil : game_hash[:score5].to_i
      score6 = game_hash[:score6].blank? ? nil : game_hash[:score6].to_i


      if game_hash[:locked].nil?
        locked = nil
      else
        locked = (['1','t','true','yes','on'].include?( game_hash[:locked] ))
      end
      
      if((score1.present? && game.score1 != score1) ||
         (score2.present? && game.score2 != score2) ||
         (score3.present? && game.score3 != score3) ||
         (score4.present? && game.score4 != score4) ||
         (score5.present? && game.score5 != score5) ||
         (score6.present? && game.score6 != score6) ||
         (locked.nil? == false && game.locked != locked))

        logger.info "*** updating game #{game_id} (score1: #{score1}, score2: #{score2}, score3: #{score3}, score4: #{score4}, score5: #{score5}, score6: #{score6}, locked: #{locked})"

        game.score1 = score1  if score1.present?
        game.score2 = score2  if score2.present?
        game.score3 = score3  if score3.present?
        game.score4 = score4  if score4.present?
        game.score5 = score5  if score5.present?
        game.score6 = score6  if score6.present?
        game.locked = locked  if locked.nil? == false   # nb: can't use locked.present? because false fails
        game.save!
      else
        logger.info "*** skip updating game #{game_id} - no changes"
      end
    end
    flash[:success] = 'Spiele erfolgreich gespeichert.'
   end
  
    redirect_to update_path()
  end
    
end # class UpdateController