
def export_users
  
  ## NB: use rake export_users (see lib/tasks or rake -T)
  
  puts "## Users"
  puts ""

  User.all.each do |user|
    puts "user-#{user.id},#{user.key},#{user.name},#{user.email},#{user.password_digest},#{user.admin},#{user.guest},#{user.active}"
  end

  puts "DONE - - #{User.count} Users."  
  
end


def update_import_export_keys
  
  puts ">> Update Keys (#{Time.now}):"

  puts ""
  puts "## Games"
  
    Game.all.each do |game|
      if game.calc?
        game.key = "#{game.round.event.key}+#{game.round.pos}+calc+#{game.team1.key}+#{game.team2.key}"
      else
        game.key = "#{game.round.event.key}+#{game.round.pos}+#{game.team1.key}+#{game.team2.key}"
      end
      game.job_running!
      game.save!
      game.job_done!
      puts "  #{game.team1.title} vs. #{game.team2.title} => #{game.key}"
    end

  puts ""
  puts "## Pools"
  
    Pool.all.each do |pool|
      # update key if nil or if auto-generated (assuming contains/includes +)
      if pool.key.nil? || pool.key.include?('+')
        pool.key = "#{pool.event.key}+#{pool.fix? ? 'fix' : 'flex'}+#{pool.user.key}"
        pool.save!
        puts "  #{pool.full_title} by #{pool.user.name} => #{pool.key}"
      end
    end

  puts ""
  puts "<< DONE - #{User.count} Users, #{Game.count} Games, #{Pool.count} Pools."
end

def import_backup_data( data )   # data as all-in-one string

  user_count = 0
  tip_count  = 0
  play_count = 0

  puts ">> Import Backup Data (#{Time.now}):"

  data.lines.each_with_index do |line_with_newline,i|

      line = line_with_newline.chomp   # remove (chomp) trailing newline if present

      # skip empty and comment lines (supporting # and ; and //)
      if line =~ /^\s*$/ || line =~ /^\s*(#|;|\/\/)/
        puts "#{i+1}: skipping $#{line}$"
        next
      end
      
      fields = line.split( ',' )

      puts "#{i+1}: $#{line}$"
      puts "   $#{fields.join('|')}$"
    
      if fields[0].starts_with?( 'user' ) 
        user = User.find_by_key!( fields[1] )
        # 2 - name
        # 3 - email
        user.password_digest = fields[4]
        user.save!

        user_count += 1
      elsif fields[0].starts_with?( 'play' )
        user = User.find_by_key!( fields[1] )
        pool = Pool.find_by_key!( fields[2] )
   
        play = Play.find_by_user_id_and_pool_id( user.id, pool.id )
        if play.nil?
          puts "   *** Adding Play"
          play = Play.new
          play.user = user
          play.pool = pool
        else
          puts "   *** Updating Play"
        end
        play.team1 = fields[3].blank? ? nil : Team.find_by_key!( fields[3] )
        play.team2 = fields[4].blank? ? nil : Team.find_by_key!( fields[4] )
        play.team3 = fields[5].blank? ? nil : Team.find_by_key!( fields[5] )
        play.save!
   
        play_count += 1
      elsif fields[0].starts_with?( 'tip' )
        user = User.find_by_key!( fields[1] )
        pool = Pool.find_by_key!( fields[2] )

        ## nb: import hack for world.quali.euro.2012/13  - ignore round; just use teams for lookup
        if fields[3] =~ /world.quali.euro.2012\/13.+\+([a-z]{3})\+([a-z]{3})/
          team1 = Team.find_by_key!( $1 )
          team2 = Team.find_by_key!( $2 )
          game = Game.find_by_team1_id_and_team2_id!( team1.id, team2.id )
        else
          game = Game.find_by_key!( fields[3] )
        end
        
        tip = Tip.find_by_user_id_and_pool_id_and_game_id( user.id, pool.id, game.id )
        if tip.nil?
          if game.calc?
            puts "   *** Adding CalcTip"
            tip = CalcTip.new
          else
            puts "   *** Adding Tip"
            tip = Tip.new
          end
          tip.user = user
          tip.pool = pool
          tip.game = game
        else
          puts "   *** Updating Tip"
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
        puts '!!! unknown record type (expecting play|tip)'
      end
      
  end  # each lines

  puts ""
  puts "<< DONE - #{play_count} Plays, #{tip_count} Tips, #{user_count} Users."

end # method import_backup_data