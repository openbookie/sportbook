class PoolsController < ApplicationController

  # GET /pools
  def index
    @pools = Pool.all
    
    # find next upcoming games
    
    limit = params[:limit] || '4'
    
    @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit(limit)
    @past_games     = Game.where( 'play_at < ?', Time.now ).order( 'play_at desc').limit(limit)
  end
  
  # GET /pools/new
  def new
    @pool = Pool.new
  end

  # POST /pools
  def create
    @pool = Pool.new(params[:pool])
    @pool.user = current_user()

    if @pool.save
      redirect_to pools_path(), notice: 'Pool erfolgreich gespeichert.' 
    else
      render action: 'new'
    end
  end
  
  # GET /pools/1/edit
  def edit
    @pool = Pool.find(params[:id])
  end

  # PUT /pools/1
  def update
    @pool = Pool.find(params[:id])

    if @pool.update_attributes(params[:pool])
      redirect_to pools_path(), notice: 'Pool erfolgreich gespeichert.'
    else
      render action: 'edit'
    end
  end

  def add_player_to
    @pool = Pool.find(params[:id])
    @pool.players << current_user()
    
    ## todo: how to get play_id??  (form pool.players << current_user)
    ##  use edit_play() route (otherwise flash message get lost (two redirects))
    
    flash[ :success ] = "Willkommen im Wettpool. Los geht's."
    redirect_to edit_pool_player_path( @pool, current_user() )
  end
  
  # GET /pools/1
  def show
    @pool = Pool.find(params[:id])
  end
  
  # DELETE /pools/1
  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy

    redirect_to pools_path() 
  end
  
end # class PoolsController