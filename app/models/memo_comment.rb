class MemoComment < ApplicationRecord
  belongs_to :user
  belongs_to :memo
  validates :comment, presence: true, length: { maximum: 200 }

  validates :rates, numericality: {
    less_than_or_equal_to: 5.0,
    greater_than_or_equal_to: 0.0
  }
end