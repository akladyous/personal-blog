class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # def likes?(post)
  #   post.likes.where(user_id: id).any?
  # end

end
