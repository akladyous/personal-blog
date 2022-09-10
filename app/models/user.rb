class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  # user we are following
  has_many :following_users, class_name: 'Friendship', foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :following_users, source: :followed
  # user following us
  has_many :followed_users, class_name: 'Friendship', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :followed_users, source: :follower

  def follow(user)
    # following_users.create(followed_id: user.id)
    Friendship.find_or_create_by(follower_id: current_user.id, followed_id: user.id)
  end

  def unfollow(user)
    Friendship.where(follower_id: current_user.id, followed_id: user.id).destroy_all
    current_user.following_users.where(followed_id: user.id)
  end

  def is_following?(user)
    current_user.following&.include?(user)
  end
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def likes?(post)
    post.likes.where(user_id: id).any?
  end
end
