class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  has_rich_text :content

  validates :title, presence: true
  validate :validate_content

  def validate_content
    if self.content.body.blank?
      errors.add(:content, "Can't be blank")
    end
  end

  def belongs_to?(user)
    self.user.id == user.id
  end
end
