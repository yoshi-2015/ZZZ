class Memo < ApplicationRecord
  belongs_to :user
  validates :category, presence: true, length: { in: 2..15 }
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 200 }
end
