# encoding: utf-8

class Admin::JobsController < Admin::BaseController
  
  
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

  def wipe_out_time
    # delete/clear timeline (that is, all action items in news feed)

    txt = ""
    txt << ">> Delete #{Action.count} Actions, #{Activity.count} Activities - (#{Time.now}):\r\n"

    Action.delete_all
    Activity.delete_all

    txt << "\r\n<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
  end
  

  def wipe_out_points
    # delete/clear points n bonus_points

    txt = ">> Delete #{Point.count} points, #{BonusPoint.count} bonus points (#{Time.now}):\r\n"

    Point.delete_all
    BonusPoint.delete_all

    txt << "\r\n<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
  end
  
  
  def keys
    txt = ">> Update Keys (#{Time.now}):\r\n"

    update_import_export_keys()

    txt << ">> DONE (#{Time.now}) - #{User.count} Users, #{Game.count} Games, #{Pool.count} Pools."
    
    render :text => "<pre>#{txt}</pre>"
  end
  

  def calc
    start = Time.now
    
    recalc()
    
    txt = "Recalc points done (in #{Time.now-start} s) - #{Pool.count} Pools, #{Play.count} Plays, #{Tip.count} Tips, #{BonusTip.count} Bonus Tips."
    
    render :text => "<pre>#{txt}</pre>"
  end


  def debug_calc
    start = Time.now
    
    o = StringIO.new
    o.puts ">> Recalc Points (#{start}):"

    # 1) turn on debugging / details
    # 2) redirect out(put) to string buffer, that is, buf
    recalc( out: o, debug: true )

    o.puts "\r\n<< DONE (in #{Time.now-start} s) - #{Pool.count} Pools, #{Play.count} Plays, #{Tip.count} Tips, #{BonusTip.count} Bonus Tips."

    render :text => "<pre>#{o.string}</pre>"
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