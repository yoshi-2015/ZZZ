class Memo < ApplicationRecord
  belongs_to :user
  has_many :memo_comments, dependent: :destroy
  has_many :favorites ,dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # validates :category, presence: true, length: { in: 2..15 }
  # validates :title, presence: true, length: { maximum: 20 }
  # validates :body, presence: true, length: { maximum: 200 }
end
