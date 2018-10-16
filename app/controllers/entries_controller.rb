class EntriesController < ApplicationController
  def create
    entry = current_user.entries.create(game_id: params[:game_id])
    redirect_to games_url, notice: "#{entry.game.title}のお気に入り登録しました"
  end

  def destroy
    entry = current_user.entries.find_by(id: params[:id]).destroy
    redirect_to games_url, notice: "#{entry.game.title}のお気に入り解除しました"
  end
end
