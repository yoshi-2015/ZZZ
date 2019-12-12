class MemoComment < ApplicationRecord
  belongs_to :user
  belongs_to :memo
end
