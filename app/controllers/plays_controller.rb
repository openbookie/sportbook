# encoding: utf-8

class PlaysController < ApplicationController
  
  # GET /plays?pool_id=:id
  def index
    @pool   = Pool.find( params[:pool_id] )
    @users  = @pool.players.order(:name)

    @show_pts  = param_show_pts?
    @show_tips = param_show_tips?
    
    @rounds = @pool.flex? ? @pool.event.flex_rounds.all : @pool.event.fix_rounds.all
  end

  # GET /plays/:id
  def show
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user
    
    @rounds = @pool.flex? ? @pool.event.flex_rounds.all : @pool.event.fix_rounds.all
  end

  # GET /plays/:id/edit
  def edit
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user

    # show odds by default
    @show_odds  = param_show_odds?


    pool_rounds = @pool.flex? ? @pool.event.flex_rounds.all : @pool.event.fix_rounds.all
    pool_rounds.each do |round|
      round.games.each do |game|
        # make sure all games exists as tips
        tips = @user.tips.where( :pool_id => @pool.id, :game_id => game.id ).all
        pp tips
        if tips.empty?
          if game.calc?
            tip = CalcTip.create!( :user => @user, :pool => @pool, :game => game )
            puts "*** adding calc tip #{tip.id} for calc game #{game.id}"
          else
            tip = Tip.create!( :user => @user, :pool => @pool, :game => game )
            puts "*** adding tip #{tip.id} for game #{game.id}"
          end
        else
          puts "*** found tip for game #{game.id}"
        end
      end # each game
    end # each round
    
  end # method edit

  # PUT /plays/:id
  def update

    ## fix/todo: check for errors on save (e.g. game over? no more changes allowed!)

    play = Play.find( params[:id] )

    # only update if has changes (to avoid duplicate/false action item in news feed)
   
    team1_id = params[:play][:team1_id].blank? ? nil : params[:play][:team1_id].to_i
    team2_id = params[:play][:team2_id].blank? ? nil : params[:play][:team2_id].to_i
    team3_id = params[:play][:team3_id].blank? ? nil : params[:play][:team3_id].to_i
   
    if( play.team1_id != team1_id || play.team2_id != team2_id || play.team3_id != team3_id )
      
      logger.info "*** updating play (#{team1_id},#{team2_id},#{team3_id})"
      
      play.team1_id = team1_id
      play.team2_id = team2_id
      play.team3_id = team3_id
      play.save!
    else
      logger.info "*** skip updating play - no changes"
    end  
      

   # check for case w/ no tips
   if params[:play][:tips]
    params[:play][:tips].each do |tip_key,tip_hash|
      tip = Tip.find( tip_key )
      
      # only update if has changes (to avoid duplicate/false action item in news feed)
      
      score1 = tip_hash[:score1].blank? ? nil : tip_hash[:score1].to_i
      score2 = tip_hash[:score2].blank? ? nil : tip_hash[:score2].to_i
      score3 = tip_hash[:score3].blank? ? nil : tip_hash[:score3].to_i
      score4 = tip_hash[:score4].blank? ? nil : tip_hash[:score4].to_i
      score5 = tip_hash[:score5].blank? ? nil : tip_hash[:score5].to_i
      score6 = tip_hash[:score6].blank? ? nil : tip_hash[:score6].to_i
      
      calc_team1_id = tip_hash[:calc_team1_id].blank? ? nil : tip_hash[:calc_team1_id].to_i
      calc_team2_id = tip_hash[:calc_team2_id].blank? ? nil : tip_hash[:calc_team2_id].to_i
            
      if (tip.score1 != score1 || tip.score2 != score2 ||
          tip.score3 != score3 || tip.score4 != score4 ||
          tip.score5 != score5 || tip.score6 != score6 ||
          (tip.calc? && tip.calc_team1_id != calc_team1_id) ||
          (tip.calc? && tip.calc_team2_id != calc_team2_id))

        logger.info "*** updating tip #{tip_key} (#{score1}:#{score2})"

        tip.score1 = score1
        tip.score2 = score2
        tip.score3 = score3
        tip.score4 = score4
        tip.score5 = score5
        tip.score6 = score6
        
        if tip.calc?
          tip.calc_team1_id = calc_team1_id
          tip.calc_team2_id = calc_team2_id
        end
        
        tip.save!
      else
        logger.info "*** skip updating tip #{tip_key} - no changes"
      end
    end
   end

    flash[:success] = 'Tipps erfolgreich gespeichert.'
        
    redirect_to edit_play_path( play )
  end
  
  private
  def param_show_pts?
    # do NOT show points by default
    params[:pts].present? && ['1','t','true','yes', 'on'].include?( params[:pts])
  end
  
  def param_show_tips?
    # show tips by default
    params[:tips].nil? || (params[:tips].present? && ['1','t','true','yes', 'on'].include?( params[:tips]))
  end

  def param_show_odds?
    # show odds (quotes) by default
    params[:odds].nil? || (params[:odds].present? && ['1','t','true','yes', 'on'].include?( params[:odds]))
  end  

end  # class PlaysController