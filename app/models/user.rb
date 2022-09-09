class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy
  has_many :likes

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def likes?(post)
    post.likes.where(user_id: id).any?
  end
end
