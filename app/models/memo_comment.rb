class MemoComment < ApplicationRecord
  belongs_to :user
  belongs_to :memo
  validates :comment, presence: true, length: { maximum: 200 }
end
