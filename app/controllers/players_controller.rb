
class PlayersController < ApplicationController
  

  # GET /pools/:pool_id/players  
  def index
    @pool  = Pool.find(params[:pool_id])
    @users = @pool.players
    
    ## todo/fix: get groups via @pool.event.groups 
    @groups = GameGroup.where( :event_id => @pool.event.id ).order( :pos ).all    
  end

  # GET/pools/:pool_id/players/:id
  def show
    @pool = Pool.find(params[:pool_id])
    @user = User.find(params[:id])

    @play = Play.where( :pool_id => @pool.id, :user_id => @user.id ).first
    
    @groups = GameGroup.where( :event_id => @pool.event.id ).order( :pos ).all
  end

  def edit
    @pool = Pool.find(params[:pool_id])
    @user = User.find(params[:id])

    @play = Play.where( :pool_id => @pool.id, :user_id => @user.id ).first
    
    @team_options = [[ '--Team--', nil ]] + @pool.event.teams.all.map { |rec| [ rec.title, rec.id ] }
    
    GameGroup.where( :event_id => @pool.event.id ).order( :pos ).all.each do |group |
      group.games.order( :pos ).all.each do |game|
        # make sure all games exists as tips
        tips = @user.tips.where( :pool_id => params[:pool_id] ).where( :game_id => game.id )
        pp tips
        if tips.empty?
          Tip.create!( :user => @user, :pool => @pool, :game => game )
          puts "*** adding tip for game #{game.id}"
        else
          puts "*** found tip for game #{game.id}"
        end
      end
    end

    @groups = GameGroup.where( :event_id => @pool.event.id ).order( :pos ).all
  end
  
  def update
    @pool = Pool.find(params[:pool_id])
    @user = User.find(params[:id])
    
    puts "*** updating play"
    ## fix/todo: check for error - exits update_attributes!
    @play = Play.where( :pool_id => @pool.id, :user_id => @user.id ).first
    @play.update_attributes( params[:user][:play] )
        
=begin
  ## fix: use save w/ nested attributes??
if @user.update_attributes( params[:user])
      # success
      flash.now[:notice] = 'Tipps Erfolgreich gespeichert.'
    else
      # failure
      flash.now[:error] = 'Fehler beim Speichern der Tipps.'
      ## todo: use redirect etc.
    end
=end

   params[:user][:tips].each do |tip_key,tip_value|
      tip = Tip.find( tip_key )
      puts "*** updating tip #{tip_key}"
      tip.update_attributes( tip_value )
      tip.save!
   end

    flash[:success] = 'Tipps erfolgreich gespeichert.'
        
    redirect_to pool_player_path( @pool, @user )
  end
end
