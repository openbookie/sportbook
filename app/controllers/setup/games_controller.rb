class Setup::GamesController < Setup::BaseController

  # GET /games
  def index
    @events = Event.all
  end

 # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games
  def create
    @game = Game.new(params[:game])

    if @game.save
      redirect_to games_path(), notice: 'Spiel erfolgreich gespeichert.' 
    else
      render action: 'new'
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # PUT /games/1
  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      redirect_to games_path(), notice: 'Spiel erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path() 
  end

end # class GamesController