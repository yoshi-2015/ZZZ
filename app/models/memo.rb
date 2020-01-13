class Memo < ApplicationRecord
  belongs_to :user
  has_many :memo_comments, dependent: :destroy
  has_many :favorites ,dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 200 }

  def self.search(method,word)
    if method == "1" #部分一致
      @memos = Memo.where("title LIKE?","%#{word}%")
    elsif method == "2" #完全一致
      @memos = Memo.where("title LIKE?","#{word}")
    elsif method == "3" #前方一致
      @memos = Memo.where("title LIKE?","#{word}%")
    elsif method == "4" #後方一致
      @memos = Memo.where("title LIKE?","%#{word}")
    else
      @memos = Memo.all
    end
  end
end
