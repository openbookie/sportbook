class Setup::TeamsController < Setup::BaseController

  # GET /teams
  def index
    @teams = Team.all
  end

end # class TeamsController