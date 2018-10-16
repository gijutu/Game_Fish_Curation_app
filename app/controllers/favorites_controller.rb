class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(game_id: params[:game_id])
    redirect_to games_url, notice: "#{favorite.game.title}のお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to games_url, notice: "#{favorite.game.title}のお気に入り解除しました"
  end
end
