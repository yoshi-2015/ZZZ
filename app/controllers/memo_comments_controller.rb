class MemoCommentsController < ApplicationController
  def create
    memo = Memo.find(params[:memo_id])
    comment = current_user.memo_comments.new(memo_comment_params)
    comment.memo_id = memo.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # ページからコントローラーにコメントのIDを持ってくる・・・
    # /memos/#{@memo.id}/memo_comments/#{@memo_comment.id}/を作り上げる＝memo_comment.idを探して、デストロイさせる！！
    # memo = Memo.find(params[:memo_id])
    # comment = current_user.memo_comments.find(params[:id])
    comment = MemoComment.find(params[:id])
    # memo = Memo.find(params[:memo_id])
    # comment = current_user.memo_comments.find_by(comment: comment)
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def memo_comment_params
    params.require(:memo_comment).permit(:comment, :user_id, :memo_id)
  end
end