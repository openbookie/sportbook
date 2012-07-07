class Db::CalcGamesController < Db::BaseController

  # GET /calc_games/new
  def new
    @game = CalcGame.new
  end

  # POST /calc_games
  def create
    @game = CalcGame.new(params[:calc_game])

    if @game.save
      redirect_to games_path(), :notice => 'Spiel erfolgreich gespeichert.' 
    else
      render :action => 'new'
    end
  end

  # GET /calc_games/1/edit
  def edit
    @game = CalcGame.find(params[:id])
  end

  # PUT /calc_games/1
  def update
    @game = CalcGame.find(params[:id])

    if @game.update_attributes(params[:calc_game])
      redirect_to games_path(), :notice => 'Spiel erfolgreich gespeichert.' 
    else
      render :action => 'edit' 
    end
  end

  # DELETE /calc_games/1
  def destroy
    @game = CalcGame.find(params[:id])
    @game.destroy

    redirect_to games_path() 
  end

end # class CalcGamesController