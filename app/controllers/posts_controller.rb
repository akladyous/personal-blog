class PostsController < ApplicationController
  include ActionView::Helpers::UrlHelper
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_post, only: %i[edit update destroy]
  before_action :current_user_posts
  after_action :increment_view_count, only: :show

  def prova
    # debugger
    user_signed_in? && params[:user_id].present?
  end
  def index
    @posts = Post.order(created_at: :desc).limit(10).with_rich_text_content_and_embeds unless user_signed_in?
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def current_user_posts
    return @posts = Post.order(created_at: :desc).limit(10).with_rich_text_content_and_embeds unless user_signed_in?
    if current_page?(user_posts_path(current_user))
      @posts = current_user.posts.order(:created_at => :desc).with_rich_text_content_and_embeds
    else
      @posts = Post.order(created_at: :desc).limit(10).with_rich_text_content_and_embeds
    end
  end

  def increment_view_count
    @post.increment! :view_count
  end
end
