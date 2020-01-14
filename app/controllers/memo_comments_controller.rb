class MemoCommentsController < ApplicationController
  def create
    @memo = Memo.find(params[:memo_id])
    @memo_comment = current_user.memo_comments.new(memo_comment_params)
    @memo_comment.memo_id = @memo.id

    if @memo_comment.save
      # redirect_to memo_path(@memo)
    else
      @user = @memo.user
      @newmemo = Memo.new
      render template: "memos/show"
    end
  end

  def destroy
    @memo = Memo.find(params[:memo_id])
    # ページからコントローラーにコメントのIDを持ってくる・・・
    # /memos/#{@memo.id}/memo_comments/#{@memo_comment.id}/を作り上げる＝memo_comment.idを探して、デストロイさせる！！
    @comment = MemoComment.find(params[:id])
    @comment.destroy
    # redirect_back(fallback_location: root_path) #非同期通信の為削除
  end

  private
  def memo_comment_params
    params.require(:memo_comment).permit(:comment, :user_id, :memo_id)
  end
end