class Admin::PoolsController < Admin::BaseController

  # GET /pools
  def index
    @pools = Pool.all
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
      redirect_to admin_pools_path(), :notice => 'Pool erfolgreich gespeichert.' 
    else
      render :action => 'new'
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
      redirect_to admin_pools_path(), :notice => 'Pool erfolgreich gespeichert.'
    else
      render :action => 'edit'
    end
  end
  


end # class PoolsController