# encoding: utf-8

class Admin::GamesController < Admin::BaseController

  def index
    limit = params[:limit] || '20'

    # find next upcoming games 
    
    @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit(limit)
  end
  
  
  def batch_update
     # mass update of games plus optional quotes
 
    games_hash = params[ :games ] || []
    games_hash.each do |game_key, game_hash|
      game = Game.find( game_key )

      # NB: time we get is now with user defined zone (e.g. +0200)
      # play_at = DateTime.strptime( game_hash[ :play_at ], '%Y-%m-%d %H:%M').to_time
      play_at = Time.parse( game_hash[ :play_at_str_db ] )

      # play_at =  Time.zone.parse( game_hash[ :play_at ] )
      puts "game play_at check: >#{play_at.to_s}< == >#{game.play_at.to_s}<"
      puts "game play_at check: >#{play_at.utc.to_s}< == >#{game.play_at.utc.to_s}<"
      
      unless play_at == game.play_at 
        game.play_at = play_at
        game.save!
        ## todo: check what gets stored in db? utc time or time with +0200??
      end
    end

    quotes_hash = params[ :quotes ] || []
    quotes_hash.each do |quote_key, quote_hash|
      quote = Quote.find( quote_key )
      
      odds1      = quote_hash[ :odds1 ].to_f
      oddsx      = quote_hash[ :oddsx ].to_f
      odds2      = quote_hash[ :odds2 ].to_f
      service_id = quote_hash[ :service_id ].to_i
      
      if( quote.odds1      != odds1 ||
          quote.oddsx      != oddsx ||
          quote.odds2      != odds2 ||
          quote.service_id != service_id )
        quote.odds1      = odds1
        quote.oddsx      = oddsx
        quote.odds2      = odds2
        quote.service_id = service_id
        quote.save!
      end
    end

    new_quotes_hash = params[ :new_quotes ] || []
    new_quotes_hash.each do |quote_key, quote_hash|
      if( quote_hash[ :service_id ].present? &&
          (quote_hash[ :odds1 ].present? || quote_hash[ :odds2 ].present? || quote_hash[ :odds3 ].present? ))
        quote = Quote.new
        quote.game_id    = quote_hash[ :game_id ].to_i
        quote.odds1      = quote_hash[ :odds1 ].present? ? quote_hash[ :odds1 ].to_f : 0
        quote.oddsx      = quote_hash[ :oddsx ].present? ? quote_hash[ :oddsx ].to_f : 0
        quote.odds2      = quote_hash[ :odds2 ].present? ? quote_hash[ :odds2 ].to_f : 0
        quote.service_id = quote_hash[ :service_id ].to_i
        quote.save!
      end
    end

    flash[:success] = 'Spiele erfolgreich gespeichert.'
    redirect_to admin_games_path()
  end


end # class GamesController
