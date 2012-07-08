class PoolsController < ApplicationController

  # GET /pools
  def index
    @pools = Pool.all
    
    # find next upcoming games
    
    limit = params[:limit] || '12'
    
    @upcoming_games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit(limit)
    @past_games     = Game.where( 'play_at < ?', Time.now ).order( 'play_at desc').limit(limit)
  end

  # GET /pools/1
  def show
    @pool = Pool.find(params[:id])
  end
  
  def add_player_to
    @pool = Pool.find(params[:id])
    @pool.players << current_user()
    
    ## todo: how to get play_id??  (form pool.players << current_user)
    ##  use edit_play() route (otherwise flash message get lost (two redirects))
    
    flash[ :success ] = "Willkommen im Wettpool. Los geht's."
    redirect_to edit_pool_player_path( @pool, current_user() )
  end
  
end # class PoolsController