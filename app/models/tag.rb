class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :posts, through: :taggables

  validates :name, presence: true

  scope :top10, -> { left_joins(:posts).merge(Post.order(view_count: :desc).limit(10)).pluck(:name) }
end
