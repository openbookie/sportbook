
## todo: move to admin ??? why - why not?

class Setup::BonusRoundsController < Setup::BaseController

  # GET /bonus_rounds
  def index
    @rounds = BonusRound.all
  end

  # GET /bonus_rounds/new
  def new
    @round = BonusRound.new
  end

  # POST /bonus_rounds
  def create
    @round = BonusRound.new(params[:bonus_round])

    if @round.save
      redirect_to bonus_rounds_path(), :notice => 'Runde erfolgreich gespeichert.' 
    else
      render :action => 'new'
    end
  end

  # GET /bonus_rounds/1/edit
  def edit
    @round = BonusRound.find(params[:id])
  end

  # PUT /bonus_rounds/1
  def update
    @round = BonusRound.find(params[:id])

    if @round.update_attributes(params[:bonus_round])
      redirect_to bonus_rounds_path(), :notice => 'Runde erfolgreich gespeichert.' 
    else
      render :action => 'edit'
    end
  end

  # DELETE /bonus_rounds/1
  def destroy
    @round = BonusRound.find(params[:id])
    @round.destroy

    redirect_to bonus_rounds_path()
  end

end # class BonusRoundsController