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

  def index
  end

  def show
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
