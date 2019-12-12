class MemoCommentsController < ApplicationController
  def create
    memo = Memo.find(params[:memo_id])
    comment = current_user.memo_comments.new(memo_comment_params)
    comment.memo_id = memo.id
    comment.save
    redirect_to memo_path(memo)
  end

  def destroy
  end

  private
  def memo_comment_params
    params.require(:memo_comment).permit(:comment, :user_id, :memo_id)
  end
end