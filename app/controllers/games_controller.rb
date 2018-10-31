class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @games = Game.includes(:labelings)
    if params['find'] == 'hit'
      params.delete(:find)
      @games = @games.search(params[:title])
      @search = @games.ransack(params[:q])
    elsif params['find'] == 'hit'|| params[:text].present?
      @q = Game.ransack(params[:q])
      @labels = Label.all
      @games = @q.result.includes(:game_lebel)
    else
      @search = @games.ransack(params[:q])
      @games = @search.result
    end
    @games = @games.page(params[:page]).per(5)
  end

  def show
    if current_user.present?
      @favorite = current_user.favorites.find_by(game_id: @game.id)
      @entry = current_user.entries.find_by(game_id: @game.id)
    end
    @comments = @game.comments
    @comment = @game.comments.build
    @labels = Label.all
    @areas = Area.all
  end

  def new
    @game = Game.new
  end

  def edit
    @labels = Label.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      @areas = OpenArea.create!(game_id: @game.id, area_id: game_area_id)
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
    sample = params[:game].select { |key, value| key.include?("label") }.select{ |key, value| value == "1" }.keys.map{ |i| i[-1].to_i }
    if (@game.labelings.pluck(:label_id) & sample).blank? && @game.update(game_params)
      Label.where(id: sample).each do |label|
        @labels = Labeling.create(game_id: @game.id, label_id: label.id)
      end
      redirect_to games_path,notice:"大会情報をしました"
    else
      render 'edit',notice:"ラベルが被っています"
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
    params.require(:game).permit(:title, :content, :created_at, :updated_at, :the_day, :file, :remark, :price, :place, :note, :user_id)
  end

  def game_area_id
    params.require(:game).permit(:area_id)[:area_id].to_i
  end

  def correct_user
    @game = Game.find(params[:id])
    user = @game.user_id
    unless current_user.id == user
      redirect_to root_path
    end
  end
end
