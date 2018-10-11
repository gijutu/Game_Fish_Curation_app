class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
  end

  def update
  end

  def destroy
    @game.destroy
  end

  private
  def set_blog
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :content)
  end
end
