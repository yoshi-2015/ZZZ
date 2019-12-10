class MemosController < ApplicationController
  def new
    @newmemo = Memo.new
  end
  def create
    @newmemo = Memo.new(memo_params)
    @newmemo.user_id = current_user.id
    if @newmemo.save
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
  end
  def update
  end

  private
  def memo_params
    params.require(:memo).permit(:category, :title, :body)
  end
end
