class MemosController < ApplicationController
  def new
    @newmemo = Memo.new
  end
  def create
    @newmemo = Memo.new(memo_params)
    @newmemo.user_id = current_user.id
    if @newmemo.save
      flash[:notice] = "新規登録しました！"
      redirect_to memo_path(@newmemo)
    else
      render :index
    end
  end

  def index
    @newmemo = Memo.new
    @memos = Memo.all
  end

  def show
    @newmemo = Memo.new
    @memo = Memo.find(params[:id])
    @user = @memo.user
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
      flash[:notice] = "編集完了しました！Book was successfully updated."
      redirect_to memo_path(@memo)
    else
      render :edit
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:category, :title, :body)
  end
end
