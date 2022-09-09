class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_rich_text :content

  validates :title, presence: true
  validate :validate_content

  def validate_content
    if self.content.body.blank?
      errors.add(:content, "Can't be blank")
    end
  end
end
