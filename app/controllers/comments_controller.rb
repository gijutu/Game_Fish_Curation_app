class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to game_path(@game), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:game_id, :content)
  end
end
