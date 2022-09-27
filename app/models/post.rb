class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged history]

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  has_many :comments, as: :commentable
  has_rich_text :content

  validates :title, presence: true
  validate :validate_content

  def validate_content
    errors.add(:content, "Can't be blank") if content.body.blank?
  end

  def belongs_to?(user)
    self.user.id == user.id
  end
end
