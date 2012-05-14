class IcalController < ApplicationController

  # GET /ical
  def index
    
    play = Play.find( params[:play_id] )
    pool = play.pool
    user = play.user
    
    rounds = pool.flex? ? pool.event.flex_rounds.all : pool.event.fix_rounds.all
    
    txt = RiCal.Calendar do |ical|
      ical.add_x_property 'X-WR-CALNAME', "#{user.name} - #{pool.full_title} Tipps"
      
      rounds.each do |round|
        round.games.each do |game| 
          tip = Tip.find_by_user_and_pool_and_game( user, pool, game )                
          ical.event do |event|
        
            event.dtstart  =  game.play_at
            event.dtend    =  (game.play_at+90.minutes)
            event.summary = "#{game.team1.title} - #{game.team2.title}"      
        
          end
        end # each games
      end # each rounds      
    end.export
    
    render :text => txt, :content_type => 'text/calendar'
    
  end
  
end # class IcalController  
