class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show ,:edit]
  def index
    @newmemo = Memo.new
    @users = User.all
  end

  def show
    @newmemo = Memo.new
    @user = User.find(params[:id])
    @memos = @user.memos
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end
