module Users
  module UserRelations
    extend ActiveSupport::Concern

    included do
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
    end

  end
end
