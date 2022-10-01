class User < ApplicationRecord
  include Users::UserRelations
  include Users::UserRelationRequests
  # include ActionText::Attachable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments

  def full_name
    [first_name, last_name].join(' ')
  end
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  def likes?(post)
    likes.where(post_id: post.id).any?
  end
end
