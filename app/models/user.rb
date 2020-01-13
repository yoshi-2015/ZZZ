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


  # フォローする側、される側ふた通りの中間テーブルの名前を再定義
  # has_many :active_relationships, class_name: "Relationship"
  # has_many :passive_relationships, class_name: "Relationship"
  # ↑はNG 親モデルの外部キーがなんなのかという情報が足りない

  # :foreign_key - 参照先のテーブルの外部キーのカラム名を指定できる

  # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.search(method,word)
    if method == "1" #部分一致
      @users = User.where("name LIKE?","%#{word}%")
    elsif method == "2" #完全一致
      @users = User.where("name LIKE?","#{word}")
    elsif method == "3" #前方一致
      @users = User.where("name LIKE?","#{word}%")
    elsif method == "4" #後方一致
      @users = User.where("name LIKE?","%#{word}")
    else
      @users = User.all
    end
  end
end
