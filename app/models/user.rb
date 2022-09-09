class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :following_users, class_name: 'Friendship', foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :following_users, source: :followed
  has_many :followed_users, class_name: 'Friendship', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :followed_users, source: :follower


  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def likes?(post)
    post.likes.where(user_id: id).any?
  end
end
