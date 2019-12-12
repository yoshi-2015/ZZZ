class FavoritesController < ApplicationController
  def create
    memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.new(memo_id: memo.id)
    favorite.save
    redirect_to memo_path(memo)
  end

  def destroy
    memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.find_by(memo_id: memo.id)
    favorite.destroy
    redirect_to memo_path(memo)
  end
end