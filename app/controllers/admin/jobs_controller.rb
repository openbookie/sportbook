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

    txt = ">> Delete #{Action.count} Actions (#{Time.now}):\r\n"

    Action.delete_all

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
    txt = ">> Recalc Points (#{Time.now}):\r\n"

    # 1. pass - calc points per play and per round

    Pool.all.each do |pool|
      txt << "\r\n=== #{pool.full_title} (#{pool.key}) ===\r\n"
      pool.plays.each do |play|
        txt << "\r\n#{play.user.name} (#{play.user.key}):\r\n"

        play_pts = 0
        
        # note: for adding to work start with pos 1 and work your way up (that is, use order clause)
        rounds = pool.flex? ? pool.event.flex_rounds.order('pos') : pool.event.fix_rounds.order('pos')
        rounds.order( 'pos' ).each do |round|
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
      
        play.total_pts = play_pts
        play.job_running!
        play.save!
        play.job_done!
      
      end # each play (that is, user)
    end # each pool

    txt << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\r\n"
    txt << ">> 2. pass - calc rankings/positions  \r\n"
    txt << ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\r\n"

    Pool.all.each do |pool|
      txt << "\r\n=== #{pool.full_title} (#{pool.key}) ===\r\n"

      rounds = pool.flex? ? pool.event.flex_rounds.order('pos') : pool.event.fix_rounds.order('pos')      
      rounds.each do |round|
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
    
    a = Action.new
    a.tmpl = 'recalc'
    a.text = "*** NEWS - Punkte Neu Berechnet!"
    a.save!
    
    render :text => "<pre>#{txt}</pre>"
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