module Users
  module UserRelationRequests
    extend ActiveSupport::Concern

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

  end
end
