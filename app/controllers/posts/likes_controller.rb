class Posts::LikesController < ApplicationController
  before_action :set_post
  skip_before_action :authenticate_user!

  def show
    @likes = @post.likes.order(:created_at => :desc).limit(6)
    @likes_count = @post.likes.count
  end

  def create
    @post.likes.where(user_id: current_user.id).first_or_create
    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end

  def destroy
    @post.likes.where(user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end

  protected
  def set_post
    @post = Post.find(params[:post_id])
  end

end
