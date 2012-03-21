# encoding: utf-8

class PlaysController < ApplicationController
  
  # GET /plays?pool_id=:id
  def index
    @pool   = Pool.find( params[:pool_id] )
    @users  = @pool.players.order(:name)
    
    ## todo/fix: make order( :pos ) default in assoc; remove here
    @rounds = @pool.event.rounds.order( :pos ).all
  end

  # GET /plays/:id
  def show
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user
    
    ## todo/fix: make order( :pos ) default in assoc; remove here
    @rounds = @pool.event.rounds.order( :pos ).all
  end

  # GET /plays/:id/edit
  def edit
    @play = Play.find( params[:id] )
    @pool = @play.pool  
    @user = @play.user
    
    @team_options = [[ '- Team wählen -', nil ]] + @pool.event.teams.all.map { |rec| [ rec.title, rec.id ] }

    @pool.event.rounds.order( :pos ).each do |round|
      round.games.order( :pos ).all.each do |game|
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

    ## todo/fix: make order( :pos ) default in assoc; remove here
    @rounds = @pool.event.rounds.order( :pos ).all
  end

  # PUT /plays/:id  
  def update
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user
    
    puts "*** updating play"
    ## fix/todo: check for error - exits update_attributes!
   
    @play.team1_id = params[:play][:team1_id] if params[:play][:team1_id]
    @play.team2_id = params[:play][:team2_id] if params[:play][:team2_id]
    @play.team3_id = params[:play][:team3_id] if params[:play][:team3_id]
    @play.save!
    
   # check for case w/ no tips
   if params[:play][:tips]
    params[:play][:tips].each do |tip_key,tip_hash|
      tip = Tip.find( tip_key )
      puts "*** updating tip #{tip_key} (#{tip_hash[:score1]}:#{tip_hash[:score2]})"      
      tip.score1 = tip_hash[:score1]
      tip.score2 = tip_hash[:score2]
      tip.save!
    end
   end

    flash[:success] = 'Tipps erfolgreich gespeichert.'
        
    redirect_to edit_play_path( @play.id )
  end

end  # class PlaysController