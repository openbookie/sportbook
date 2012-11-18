class Setup::GamesController < Setup::BaseController

  # GET /games
  def index
    @events = Event.all
  end

end # class GamesController