class JobsController < ApplicationController
  
  
  def index
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

    play_nil_count = 0

    Play.all.each do |play|
      if play.export? || params[:nil]
        team1_key = play.team1_id.nil? ? '' : play.team1.key
        team2_key = play.team2_id.nil? ? '' : play.team2.key
        team3_key = play.team3_id.nil? ? '' : play.team3.key
        txt << "play-#{play.id},#{play.pool.key},#{play.user.key},#{team1_key},#{team2_key},#{team3_key}"
        txt << "\r\n"
      else
        play_nil_count += 1
      end
    end

    tip_nil_count = 0

    Tip.all.each do |tip|
      if tip.export? || params[:nil]
        txt << "tip-#{tip.id},#{tip.pool.key},#{tip.user.key},#{tip.game.key},#{tip.score1},#{tip.score2},#{tip.score3},#{tip.score4},#{tip.score5},#{tip.score6}"
        txt << "\r\n"
      else
        tip_nil_count += 1
      end
    end

    txt << "\r\n<< DONE - #{Play.count} Plays (#{play_nil_count} Nil), #{Tip.count} Tips (#{tip_nil_count} Nil)."
    
    render :text => "<pre>#{txt}</pre>"
  end
  
end  # class JobsController