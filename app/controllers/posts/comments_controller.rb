class Posts::CommentsController < CommentsController
  before_action :set_commentable

  def new
    @commentable = current_user.comments.new(commentable: @commentable)
  end

  protected
    def set_commentable
      @commentable = Post.find(params[:post_id])
    end
end
