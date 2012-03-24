class ImportsController < ApplicationController
  
  # POST /import
  def create

    data = params[:data]

    tip_count  = 0
    play_count = 0

    txt = ">> Import Backup Data (#{Time.now}):\r\n"

    data.lines.each_with_index do |line_with_newline,i|

      line = line_with_newline.chomp   # remove (chomp) trailing newline if present

      # skip empty and comment lines (supporting # and ; and //)
      if line =~ /^\s*$/ || line =~ /^\s*(#|;|\/\/)/
        txt << "#{i+1}: skipping $#{line}$ \r\n"
        next
      end
      
      fields = line.split( ',' )

      txt << "#{i+1}: $#{line}$ \r\n"
      txt << "   $#{fields.join('|')}$ \r\n"
    
      if fields[0].starts_with?( 'play' )
        user = User.find_by_key!( fields[1] )
        pool = Pool.find_by_key!( fields[2] )
   
        play = Play.find_by_user_id_and_pool_id( user.id, pool.id )
        if play.nil?
          txt << "   *** Adding Play \r\n"
          play = Play.new
          play.user = user
          play.pool = pool
        else
          txt << "   *** Updating Play \r\n"
        end
        play.team1 = fields[3].blank? ? nil : Team.find_by_key!( fields[3] )
        play.team2 = fields[4].blank? ? nil : Team.find_by_key!( fields[4] )
        play.team3 = fields[5].blank? ? nil : Team.find_by_key!( fields[5] )
        play.save!
   
        play_count += 1
      elsif fields[0].starts_with?( 'tip' )
        user = User.find_by_key!( fields[1] )
        pool = Pool.find_by_key!( fields[2] )
        game = Game.find_by_key!( fields[3] )
        
        tip = Tip.find_by_user_id_and_pool_id_and_game_id( user.id, pool.id, game.id )
        if tip.nil?
          txt << "   *** Adding Tip \r\n"
          tip = Tip.new
          tip.user = user
          tip.pool = pool
          tip.game = game
        else
          txt << "   *** Updating Tip \r\n"
        end
        tip.score1 = fields[4].blank? ? nil : fields[4].to_i
        tip.score2 = fields[5].blank? ? nil : fields[5].to_i
        tip.score3 = fields[6].blank? ? nil : fields[6].to_i
        tip.score4 = fields[7].blank? ? nil : fields[7].to_i
        tip.score5 = fields[8].blank? ? nil : fields[8].to_i
        tip.score6 = fields[9].blank? ? nil : fields[9].to_i
        tip.save!
        
        tip_count += 1
      else
        txt << '!!! unknown record type (expecting play|tip)'
      end
    
    
    end

    txt << "\r\n<< DONE - #{play_count} Plays, #{tip_count} Tips."
    
    render :text => "<pre>#{txt}</pre>"

  end

end # class ImportsController