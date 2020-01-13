class SearchsController < ApplicationController
  def search
    table = params[:table]
    if table == "1" #ユーザー検索
      @newmemo = Memo.new
      @users = User.search(params[:method],params[:word])
      render template: "users/index"
    elsif table == "2" #投稿検索
      @newmemo = Memo.new
      @memos = Memo.search(params[:method],params[:word])
      render template: "memos/index"
    end
  end
end


      # search(method,word)
      # if method == "1" #部分一致
      #   @users = User.where("name LIKE?","%#{word}%")
      # elsif method == "2" #完全一致
      #   @users = User.where("name LIKE?","#{word}")
      # elsif method == "3" #前方一致
      #   @users = User.where("name LIKE?","#{word}%")
      # elsif method == "4" #後方一致
      #   @users = User.where("name LIKE?","%#{word}")
      # else
      #   @users = User.all
      # end
      # @users = User.search(params[:method],params[:word])