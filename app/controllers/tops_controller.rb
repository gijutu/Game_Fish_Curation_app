class TopsController < ApplicationController
  def index
    @games = Game.all
  end
end
