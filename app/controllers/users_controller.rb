class UsersController < ApplicationController
  def index
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
