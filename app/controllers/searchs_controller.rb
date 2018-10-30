class SearchsController < ApplicationController
  def index
    @q = Game.includes(:labeling_labels).ransack(params[:q])
    @games = @q.result(distinct: true).page(params[:page]).per(3)
  end

  def search
    @q = Game.search(search_params)
    @games = @q.result(distinct: true)
  end

  def search_params
    params.require(:q).permit!
  end
end
