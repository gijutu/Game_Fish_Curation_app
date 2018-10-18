class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'プロフィールを編集しました！'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :icon, :keep_team_id, :kana_name, :gender, :name)
  end

end
