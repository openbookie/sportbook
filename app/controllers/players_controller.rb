class PlayersController < ApplicationController
  
  # GET /pools/:pool_id/players/:id
  def show
    pool = Pool.find( params[:pool_id] )
    user = User.find( params[:id] )
    play = Play.find_by_pool_id_and_user_id!( pool.id, user.id )

    # let play controller/resource handle show    
    redirect_to play_path(play.id)
  end
  
  # GET /pools/:pool_id/players/:id
  def edit
    pool = Pool.find( params[:pool_id] )
    user = User.find( params[:id] )
    play = Play.find_by_pool_id_and_user_id!( pool.id, user.id )

    # let play controller/resource handle edit    
    redirect_to edit_play_path(play.id)
  end
  
end   # class PlayersController