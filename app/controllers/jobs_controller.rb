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