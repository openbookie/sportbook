# encoding: utf-8

class JobsController < ApplicationController
  
  
  def index
  end
  
  def wipe_out
    # delete all plays and tips

    txt = ">> Delete #{Play.count} Plays and #{Tip.count} Tips (#{Time.now}):\r\n"

    Tip.delete_all
    Play.delete_all

    txt << "\r\n<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
  end
  
  def keys
    txt = ">> Update Keys (#{Time.now}):\r\n"

    txt << "\r\n## Users\r\n"
    User.all.each do |user|
      user.key = "#{user.email}"  # for now email is same as key
      user.save!
      txt << "  #{user.name} => #{user.key}\r\n"
    end

    txt << "\r\n## Games\r\n"
    Game.all.each do |game|
      game.key = "#{game.round.event.key}+#{game.round.pos}+#{game.team1.key}+#{game.team2.key}"
      game.save!
      txt << "  #{game.team1.title} vs. #{game.team2.title} => #{game.key}\r\n"
    end

    txt << "\r\n## Pools\r\n"
    Pool.all.each do |pool|
      # update key if nil or if auto-generated (assuming contains/includes +)
      if pool.key.nil? || pool.key.include?('+')
        pool.key = "#{pool.event.key}+#{pool.fix? ? 'fix' : 'flex'}+#{pool.user.key}"
        pool.save!
        txt << "  #{pool.full_title} by #{pool.user.name} => #{pool.key}\r\n"
      end
    end

    txt << "\r\n<< DONE - #{User.count} Users, #{Game.count} Games, #{Pool.count} Pools."
    
    render :text => "<pre>#{txt}</pre>"
  end
  
  def calc
    txt = ">> Recalc Points (#{Time.now}):\r\n"

    # 1. pass - calc points per play and per round

    Pool.all.each do |pool|
      txt << "\r\n=== #{pool.full_title} (#{pool.key}) ===\r\n"
      pool.plays.each do |play|
        txt << "\r\n#{play.user.name} (#{play.user.key}):\r\n"

        play_pts = 0
        
        # note: for adding to work start with pos 1 and work your way up (that is, use order clause)
        pool.event.rounds.order( 'pos' ).each do |round|
          txt << "[#{round.pos}] #{round.title}: "
          
          round_pts = 0
          
          round.games.each do |game|
            # fix: use play.tips.where()
            tip =  Tip.where( :user_id => play.user_id,
                              :pool_id => play.pool.id,
                              :game_id => game.id ).first
            
            if tip.present?
              tip_pts = tip.calc_points
              round_pts += tip_pts
              txt << "#{tip_pts} "
            end
                        
          end # each game
        
          play_pts += round_pts
          txt << " => #{round_pts} (#{play_pts}) pts\r\n"
          
          pts = Point.find_by_user_id_and_pool_id_and_round_id( play.user_id, play.pool_id, round.id )
          if pts.nil?
            pts = Point.new 
            pts.user_id  = play.user_id
            pts.pool_id  = play.pool_id
            pts.round_id = round.id
          end
          pts.round_pts  = round_pts
          pts.total_pts  = play_pts
          pts.save!
          
        end # each round
      
        play.points = play_pts
        play.save!
      
      end # each play (that is, user)
    end # each pool

    txt << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\r\n"
    txt << ">> 2. pass - calc rankings/positions  \r\n"
    txt << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\r\n"

    Pool.all.each do |pool|
      txt << "\r\n=== #{pool.full_title} (#{pool.key}) ===\r\n"
      
      pool.event.rounds.each do |round|
        txt << "[#{round.pos}] #{round.title}:\r\n"
        
        rankings = Point.where( :pool_id => pool.id, :round_id => round.id ).order( 'round_pts desc' ).all
        
        pos     =-1
        last_pts=-1

        rankings.each_with_index do |ranking,i|
          pos=i+1 if ranking.round_pts != last_pts

          ranking.round_pos = pos
          ranking.save!
          
          last_pts = ranking.round_pts
        end

        rankings = Point.where( :pool_id => pool.id, :round_id => round.id ).order( 'total_pts desc' ).all

        pos     =-1
        last_pts=-1

        rankings.each_with_index do |ranking,i|
          pos=i+1 if ranking.total_pts != last_pts

          ranking.total_pos = pos
          ranking.save!
          
          last_pts = ranking.total_pts
        end

      end  # each round
    end # each pool

    txt << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\r\n"
    txt << ">> 3. pass - calc diffs for totals    \r\n"
    txt << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\r\n"

    Pool.all.each do |pool|
      txt << "\r\n=== #{pool.full_title} (#{pool.key}) ===\r\n\r\n"

      pool.plays.each do |play|
        txt << "#{play.user.name} (#{play.user.key}): "
      
        last_pos = 0
        
        play.complete_rankings.each_with_index do |ranking,i|
          if i > 0
            ranking.diff_total_pos = last_pos - ranking.total_pos  # lower rank/pos is better
          else  # no diff for first record
            ranking.diff_total_pos = 0
          end
          
          ## hack: can't update record found with joins clause
          ## get new ranking  --- find a better (simpler) way
          ranking2 = Point.find( ranking.id )
          ranking2.diff_total_pos = ranking.diff_total_pos
          ranking2.save!     

          txt << "[#{i+1}] #{ranking.round_pts} #{ranking.diff_total_pos_str} "
          
          last_pos = ranking.total_pos
        end  # each ranking
        
        txt << "\r\n"
      end # each play
    end # each pool

    txt << "\r\n<< DONE - #{Pool.count} Pools, #{Play.count} Plays, #{Tip.count} Tips."
    
    render :text => "<pre>#{txt}</pre>"
  end
  
  
  def calc_old
    txt = ">> Recalc Points (#{Time.now}):\r\n"
    
    Pool.all.each do |pool|
      txt << "\r\n=== #{pool.full_title} (#{pool.key}) ===\r\n\r\n"
      pool.plays.each do |play|
        txt << "#{play.user.name} (#{play.user.key}):  "
        pts = 0
        play.tips.each do |tip|
          tip_pts = tip.calc_points
          pts += tip_pts
          txt << "#{tip_pts} "
        end
        play.points = pts
        txt << " => #{pts} pts\r\n"
        play.save!
      end  # each play
    end  # each pool
    
    txt << "\r\n<< DONE - #{Pool.count} Pools, #{Play.count} Plays, #{Tip.count} Tips."
    
    render :text => "<pre>#{txt}</pre>"
    # render :text => txt, :content_type => 'text/plain'
  end
  
  def export
    ## todo/use csv for export ???
    
    txt = ">> Export (#{Time.now}):\r\n\r\n"


    Play.all.each do |play|
      ## always export all plays for now 

      team1_key = play.team1_id.nil? ? '' : play.team1.key
      team2_key = play.team2_id.nil? ? '' : play.team2.key
      team3_key = play.team3_id.nil? ? '' : play.team3.key
      txt << "play-#{play.id},#{play.user.key},#{play.pool.key},#{team1_key},#{team2_key},#{team3_key}"
      txt << "\r\n"
    end

    tip_nil_count = 0

    Tip.all.each do |tip|
      if tip.export? || params[:nil]
        txt << "tip-#{tip.id},#{tip.user.key},#{tip.pool.key},#{tip.game.key},#{tip.score1},#{tip.score2},#{tip.score3},#{tip.score4},#{tip.score5},#{tip.score6}"
        txt << "\r\n"
      else
        tip_nil_count += 1
      end
    end

    txt << "\r\n<< DONE - #{Play.count} Plays, #{Tip.count} Tips (#{tip_nil_count} Nil)."
    
    render :text => "<pre>#{txt}</pre>"
  end
  
end  # class JobsController