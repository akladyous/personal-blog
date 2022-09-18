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
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # delegate :likes?, to: :posts
  def likes?(post)
    likes.where(post_id: post.id).any?
  end
end
