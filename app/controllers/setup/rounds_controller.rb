class Setup::RoundsController < Setup::BaseController

  # GET /rounds
  def index
    @events = Event.all
  end

end # class RoundsController