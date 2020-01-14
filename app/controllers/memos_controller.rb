class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit]
  def new
    @newmemo = Memo.new
  end

  def confirm
    @newmemo = Memo.new(memo_params)
    return if @newmemo.valid?
  end

  def back
    @newmemo = Memo.new(memo_params)
    render :new
  end

  def create
    @newmemo = Memo.new(memo_params)
    @newmemo.user_id = current_user.id
    if @newmemo.save
      flash[:notice] = "新規登録しました！"
      redirect_to memo_path(@newmemo)
    else
      @memos = Memo.all
      render :index
    end
  end

  def index
    @newmemo = Memo.new
    @memos = Memo.search(params[:method],params[:word])
  end

  def show
    @newmemo = Memo.new
    @memo = Memo.find(params[:id])
    @user = @memo.user
    @memo_comment = MemoComment.new
  end

  def edit
    @memo = Memo.find(params[:id])
    if @memo.user_id != current_user.id
      redirect_to memos_path
    else
      render :edit
    end
  end
  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      flash[:notice] = "編集しました！"
      redirect_to memo_path(@memo)
    else
      render :edit
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    flash[:notice] = "削除しました！"
    redirect_to memos_path
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :body ,:user_id)
  end
end
