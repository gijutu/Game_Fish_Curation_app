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
    @labels = Label.all
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
    # :gameのパラメータを取得する。
    # :gameのパラメータの中から、キーに"label"が含まれるハッシュを配列でとり出す。
    # その中からチェックがついているものつまり、値が"1"のハッシュを配列で取り出す。
    # keysメソッドでハッシュのキーを配列として返す。
    # mapメソッドで文字列の数字の部分を数値として配列にし、sample変数に入れる。
    # @game.labelingsから:label_idカラムの配列を取得、sample変数と重複した値を探し、重複した値があれば編集画面に返す
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
    params.require(:game).permit(:title, :content, :created_at, :updated_at, :the_day)
  end
end
