class Db::TeamsController < Db::BaseController

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/1
  def show
    @team = Team.find(params[:id])
  end

end # class TeamsController