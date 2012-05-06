# encoding: utf-8

class PlaysController < ApplicationController
  
  # GET /plays?pool_id=:id
  def index
    @pool   = Pool.find( params[:pool_id] )
    @users  = @pool.players.order(:name)

    # do NOT show points by default
    @show_pts  = (params[:pts].present? && ['1','t','true','yes', 'on'].include?( params[:pts]))
    # show tips by default
    @show_tips = (params[:tips].nil? || (params[:tips].present? && ['1','t','true','yes', 'on'].include?( params[:tips])))
    
    @rounds = @pool.event.rounds.all
  end

  # GET /plays/:id
  def show
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user
    
    @rounds = @pool.event.rounds.all
  end

  # GET /plays/:id/edit
  def edit
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user

    @pool.event.rounds.each do |round|
      round.games.each do |game|
        # make sure all games exists as tips
        tips = @user.tips.where( :pool_id => @pool.id, :game_id => game.id ).all
        pp tips
        if tips.empty?
          tip = Tip.create!( :user => @user, :pool => @pool, :game => game )
          puts "*** adding tip #{tip.id} for game #{game.id}"
        else
          puts "*** found tip for game #{game.id}"
        end
      end
    end

    @rounds = @pool.event.rounds.all
    @groups = @pool.event.groups.all
  end

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
            
      if tip.score1 != score1 || tip.score2 != score2

        logger.info "*** updating tip #{tip_key} (#{score1}:#{score2})"

        tip.score1 = score1
        tip.score2 = score2
        tip.save!
      else
        logger.info "*** skip updating tip #{tip_key} - no changes"
      end
    end
   end

    flash[:success] = 'Tipps erfolgreich gespeichert.'
        
    redirect_to edit_play_path( play )
  end

end  # class PlaysController