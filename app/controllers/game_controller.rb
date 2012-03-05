class GameController < ApplicationController
  def index
    @games = Game.all
  end
end
