class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save!
        format.js { render :index }
      else
        format.html { redirect_to game_path(@game), notice: '投稿できませんでした...' }
      end
    end
  end

  def update
    @game = @comment.game
    if @comment.update(comment_params)
      redirect_to game_path(@game)
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.js { render :index }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:game_id, :content, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
