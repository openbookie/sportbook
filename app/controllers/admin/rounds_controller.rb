class Admin::RoundsController < Admin::BaseController

  # GET /rounds
  def index
    @events = Event.all
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # POST /rounds
  def create
    @round = Round.new(params[:round])

    if @round.save
      redirect_to rounds_path(), notice: 'Runde erfolgreich gespeichert.' 
    else
      render action: 'new'
    end
  end

  # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
  end

  # PUT /rounds/1
  def update
    @round = Round.find(params[:id])

    if @round.update_attributes(params[:round])
      redirect_to rounds_path(), notice: 'Runde erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /rounds/1
  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    redirect_to rounds_path()
  end

end # class RoundsController