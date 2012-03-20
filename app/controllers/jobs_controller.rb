class JobsController < ApplicationController
  
  
  def index
  end
  
  def calc
    txt = ">> Recalc Points (#{Time.now}), #{Pool.count} Pools / #{Play.count} Plays / #{Tip.count} Tips:\r\n"
    
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
    
    txt << "\r\n<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
    # render :text => txt, :content_type => 'text/plain'
  end
  
  def export
    ## todo/use csv for export ???
    
    txt = ">> Export (#{Time.now}), #{Play.count} Plays / #{Tip.count} Tips:\r\n\r\n"

    ## todo: count nil records for stats

    Play.all.each do |play|
      if play.export?
        team1_key = play.team1_id.nil? ? '' : play.team1.key
        team2_key = play.team2_id.nil? ? '' : play.team2.key
        team3_key = play.team3_id.nil? ? '' : play.team3.key
        txt << "play,#{play.pool.key},#{play.user.key},#{team1_key},#{team2_key},#{team3_key}"
        txt << "\r\n"
      end
    end

    Tip.all.each do |tip|
      if tip.export?
        txt << "tip,#{tip.pool.key},#{tip.user.key},#{tip.game.key},#{tip.score1},#{tip.score2},#{tip.score3},#{tip.score4},#{tip.score5},#{tip.score6}"
        txt << "\r\n"
      end
    end

    txt << "\r\n<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
  end
  
end  # class JobsController