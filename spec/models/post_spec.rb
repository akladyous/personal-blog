require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post Associations' do
    it "has_many Likes, 'dependent: Destroy" do
      reflection = Post.reflect_on_association(:likes)
      expect(reflection.macro).to be :has_many
      expect(reflection.options[:dependent]).to eq :destroy
    end
    it "has_many 'taggables', 'dependent: Destroy" do
      reflection = described_class.reflect_on_association(:taggables)
      expect(reflection.macro).to be :has_many
      expect(reflection.options[:dependent]).to eq :destroy
    end
    it "has_many tags 'through' taggables" do
      reflection = described_class.reflect_on_association(:tags)
      expect(reflection.macro).to be(:has_many)
      expect(reflection.options[:through]).to be(:taggables)
    end
    it "has_many comments 'as' commentable 'Polymorphic Ass." do
      reflection = described_class.reflect_on_association(:comments)
      expect(reflection.macro).to be(:has_many)
      expect(reflection.options[:as]).to be(:commentable)
      expect(reflection.send(:type)).to eq("commentable_type")
    end
  end
  describe "Post has RichText Content" do
    it "has rich_text 'content'" do
      reflection = described_class.reflect_on_association :rich_text_content
      expect(reflection).to be_truthy
    end
  end
end
