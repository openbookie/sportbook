
class PlaysController < ApplicationController
  
  # GET /plays?pool_id=:id
  def index
    @pool   = Pool.find( params[:pool_id] )
    @users  = @pool.players
    ## todo/fix: make order( :pos ) default in assoc; remove here
    @groups = @pool.event.game_groups.order( :pos ).all    
  end

  # GET /plays/:id
  def show
    @play = Play.find( params[:id] )
    @pool = @play.pool
    @user = @play.user
    
    ## todo/fix: make order( :pos ) default in assoc; remove here
    @groups = @pool.event.game_groups.order( :pos ).all
  end

  # GET /plays/:id/edit
  def edit
    @play = Play.find( params[:id] )
    @pool = @play.pool  
    @user = @play.user
    
    @team_options = [[ '--Team--', nil ]] + @pool.event.teams.all.map { |rec| [ rec.title, rec.id ] }

    ## todo/fix: use @pool.event.game_groups...
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

    ## todo/fix: make order( :pos ) default in assoc; remove here
    @groups = @pool.event.game_groups.order( :pos ).all
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

   # check for case w/ no tips
   if params[:play][:tips]
    params[:play][:tips].each do |tip_key,tip_value|
      tip = Tip.find( tip_key )
      puts "*** updating tip #{tip_key}"
      tip.update_attributes( tip_value )
      tip.save!
    end
   end

    flash[:success] = 'Tipps erfolgreich gespeichert.'
        
    redirect_to play_path( @play.id )
  end

end  # class PlaysController