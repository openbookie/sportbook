class Db::TeamsController < Db::BaseController

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # POST /teams
  def create
    @team = Team.new(params[:team])

    if @team.save
      redirect_to teams_path(), notice: 'Team erfolgreich gespeichert.' 
    else
      render action: 'new'
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # PUT /teams/1
  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      redirect_to teams_path(), notice: 'Team erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /teams/1
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path()
  end

end # class TeamsController