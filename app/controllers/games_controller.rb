class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @games = Game.all
    if params['find'] == 'hit'
      params.delete(:find)
      @games = @games.search(params[:title])
      @search = @games.ransack(params[:q])
    else
      @search = @games.ransack(params[:q])
      @games = @search.result
    end
    @games = @games.page(params[:page])
  end

  def show
    @favorite = current_user.favorites.find_by(game_id: @game.id)
    @entry = current_user.entries.find_by(game_id: @game.id)
    @labelings = Labeling.all
    @labels = Label.all
  end

  def new
    @game = Game.new
  end

  def edit
    @labelings = Labeling.all
    @labels = Label.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      Label.all.each do |label|
      if params[:game]["label_#{label.id}"].to_i == 1
        @labels = Labeling.create!(game_id: @game.id, label_id: label.id)
      end
    end
      redirect_to games_path,notice:"大会情報を投稿しました"
    else
      render 'new',notice:"投稿できません"
    end
  end

  def update
    if @game.update(game_params)
      redirect_to games_path,notice: "へんしゅうしました"
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path, notice:"投稿を削除しました"
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :content, :created_at, :updated_at, :the_day)
  end
end
