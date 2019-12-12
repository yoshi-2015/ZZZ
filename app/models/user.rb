class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memos ,dependent: :destroy
  has_many :memo_comments ,dependent: :destroy
  has_many :favorites ,dependent: :destroy

  attachment :profile_image
  validates :name, presence: true, length: { in: 1..15 }
  validates :introduction, length: { maximum: 50 }
end
