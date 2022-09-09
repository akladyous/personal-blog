class Posts::LikesController < ApplicationController
  before_action :set_post

  def show
    @likes = @post.likes.count
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
