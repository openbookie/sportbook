class PoolsController < ApplicationController

  # GET /pools
  def index
    @pools = Pool.all
  end

  # GET /pools/1
  def show
    @pool = Pool.find(params[:id])
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
      redirect_to @pool, notice: 'Pool erfolgreich gespeichert.' 
    else
      render action: "new"
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
      redirect_to @pool, notice: 'Pool was successfully updated.' 
    else
      render action: "edit" 
    end
  end
  
  
  def play
    @pool = Pool.find(params[:id])    
    @pool.players << current_user() 
    
    flash[ :success ] = "Beim Pool dabei. Los geht's."         
    redirect_to edit_pool_player_path( @pool, current_user() )
  end
  
  
  # DELETE /pools/1
  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy

    redirect_to pools_url 
  end
  
end # class PoolsController