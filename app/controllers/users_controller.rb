class UsersController < ApplicationController
  before_action :current, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show;end

  def edit
    @labels = Label.all
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'プロフィールを編集しました！'
    else
      render 'edit'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :icon, :keep_team_id, :kana_name, :gender, :name, :live, :birthday)
  end

  def current
    @user = current_user
  end
end
