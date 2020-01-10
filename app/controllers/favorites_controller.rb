class FavoritesController < ApplicationController
  def create
    memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.new(memo_id: memo.id)
    favorite.save
    # redirect_to :back
    redirect_back(fallback_location: root_path)
  end

  def destroy
    memo = Memo.find(params[:memo_id])
    favorite = current_user.favorites.find_by(memo_id: memo.id)
    favorite.destroy
    # redirect_to :back
    redirect_back(fallback_location: root_path)
  end
end