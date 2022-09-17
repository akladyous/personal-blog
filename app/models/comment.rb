class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  has_many   :comments, as: :commentable

  validates :content, length: { minimum: 5, maximum: 255 }

  def deleted?
    user.nil?
  end

  def destroy
    user(user: nil, content: nil)
  end
end
