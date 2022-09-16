class Posts::RelatedController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_post

  def index
    @related_posts =  Post.where.not(id: @post.id)
                          .joins(:tags)
                          .where(tags: { name: @post.tags.pluck(:name) })
                          .distinct
                          .order(:view_count => :desc)
                          .limit(4)
                          .with_rich_text_content_and_embeds
  end

  protected
  def set_post
    @post = Post.find(params[:post_id])
  end
end
