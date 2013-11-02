
  def recalc
    Pool.all.each do |pool|
      recalc_pool( pool )
    end
  end

  def recalc_pool( pool )
    start = Time.now

    puts "recalc >#{pool.full_title}<"
    puts "  1. pass - calc points per play and per round"
    
    #################################################
    # 1. pass - calc points per play and per round
    #################################################

      pool.plays.each do |play|

        play_pts = 0
        
        # note: for adding to work start with pos 1 and work your way up (that is, use order clause)
        rounds = pool.flex? ? pool.event.flex_rounds.order('pos') : pool.event.fix_rounds.order('pos')
        rounds.order( 'pos' ).each do |round|
          round_pts = 0
          
          round.games.each do |game|
            # fix: use play.tips.where()
            ## todo/fix: make sure we have a unique index on where clause!!
            tip =  Tip.where( :user_id => play.user_id,
                              :pool_id => play.pool.id,
                              :game_id => game.id ).first
            
            if tip.present?
              tip_pts = tip.calc_points
              round_pts += tip_pts
            end
          end # each game
        
          play_pts += round_pts
          
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
      
        ## for now add bonus points at the end
        pool.bonus_rounds.order( 'pos' ).each do |round|
          round_pts = 0
          
          round.questions.each do |question|
            ## todo/fix: make sure we have a unique index on where clause!!
            tip =  BonusTip.where( :user_id => play.user_id,
                                   :question_id => question.id ).first
            
            if tip.present?
              round_pts += tip.pts
            end
          end # each bonus_question
        
          play_pts += round_pts

          pts = BonusPoint.find_by_user_id_and_pool_id_and_round_id( play.user_id, play.pool_id, round.id )
          if pts.nil?
            pts = BonusPoint.new
            pts.user_id  = play.user_id
            pts.pool_id  = play.pool_id
            pts.round_id = round.id
          end
          pts.round_pts  = round_pts
          pts.total_pts  = play_pts
          pts.save!
        end # each bonus_round
      
        play.total_pts = play_pts
        play.job_running!
        play.save!
        play.job_done!
      
      end # each play (that is, user)


    puts "  2. pass - calc rankings/positions"

    ##############################################
    ## 2. pass - calc rankings/positions 
    ##############################################

      rounds = pool.flex? ? pool.event.flex_rounds.order('pos') : pool.event.fix_rounds.order('pos')      
      rounds.each do |round|
        
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
    

    puts "  3. pass - calc diffs for totals"

    #######################################################
    ## 3. pass - calc diffs for totals
    #######################################################

      pool.plays.each do |play|
      
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
          
          last_pos = ranking.total_pos
        end  # each ranking
      end # each play
    
    a = Activity.new
    a.tmpl = 'recalc'
    a.text = "*** NEWS - #{pool.full_title} Punkte Neu Berechnet (in #{Time.now-start} s)!"
    a.save!

    puts "Recalc points done (in #{Time.now-start} s)."
  end