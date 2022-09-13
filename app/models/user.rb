class User < ApplicationRecord
  # include ActionText::Attachable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  # users we are following
  has_many :following_users, class_name: 'Friendship', foreign_key: :follower_id, dependent: :destroy
  # has_many :following, through: :following_users, source: :followed
  has_many :friends, -> { following_status :accepted }, through: :following_users, source: :followed
  has_many :requested_friends, -> { following_status :requested }, through: :following_users, source: :followed
  has_many :pending_friends,   -> { following_status :pending }, through: :following_users, source: :followed
  has_many :blocked_friends,   -> { following_status :blocked }, through: :following_users, source: :followed

  # users following us
  has_many :followed_users, class_name: 'Friendship', foreign_key: :followed_id, dependent: :destroy
  # has_many :followers, through: :followed_users, source: :follower
  has_many :followers, -> { followers_status :accepted} ,through: :followed_users, source: :follower

  scope :following_status, -> (status) { joins(:following_users).where(following_users: {status: status}) }
  scope :followers_status, -> (status) { joins(:followed_users).where(followed_users: {status: status}) }

  def follow(friend)
    Friendship.find_or_create_by(follower_id: self.id, followed_id: friend.id)
  end
  def unfollow(user)
    Friendship.where(follower_id: self.id, followed_id: user.id).destroy_all
  end

  def is_following?(user)
    self.following&.include?(user)
  end

  def request_friend(friend)
    unless self == friend || Friendship.where(follower_id: self.id, followed_id: friend.id).exists?
      transaction do
        Friendship.create(follower: self, followed: friend, status: :pending)
        Friendship.create(follower: friend, followed: self, status: :requested)
      end
    end
  end
  def accept_friend(friend)
    transaction do
      Friendship.find_by(follower: self, followed: friend, status: [:requested])&.accepted!
      Friendship.find_by(follower: friend, followed: self, status: [:pending])&.accepted!
    end
  end

  def block_friend(friend)
    transaction do
      Friendship.find_by(follower: self, followed: friend, status: [:pending, :requested, :accepted])&.blocked!
      Friendship.find_by(follower: friend, followed: self, status: [:pending, :requested, :accepted])&.blocked!
    end
  end

  def unlock_friend(friend)
    reject_friend(friend)
  end

  def reject_friend(friend)
    transaction do
      Friendship.find_by(follower: self, followed: friend)&.destroy!
      Friendship.find_by(follower: friend, followed: self)&.destroy!
    end
  end

  def has_friendship_with?(friend)
    return true if self == friend
    following_users.map(&:followed_id).include?(friend.id)
  end

  def requested_friends_with?(friend)
    return false if self == friend
    requested_friends.map(&:id).include?(friend.id)
  end

  def pending_friends_with?(friend)
    return false if self == friend
    pending_friends.map(&:id).include?(friend.id)
  end

  def friends_with?(friend)
    return false if self == friend
    friends.map(&:id).include?(friend.id)
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # delegate :likes?, to: :posts
  def likes?(post)
    likes.where(post_id: post.id).any?
  end
end
