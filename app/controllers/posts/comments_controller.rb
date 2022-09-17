class Posts::CommentsController < CommentsController
  before_action :set_commentable

  def show
  end

  def new
    @comment = current_user.comments.new(commentable: @commentable)
  end

  protected
    def post_comments_params
      params.permit(:post_id, :id)
    end
    def set_commentable
      @commentable = Post.find(params[:post_id])
    end
end
