class Posts::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_comment, only: [:edit, :update]

  def new
    @comment = current_user.comments.new(commentable: @commentable)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { post_comment_path(@commentable, @comment) }
        format.turbo_stream
      else
        format.html { render :edit }
        format.turbo_stream
      end
    end
  end
  protected
    def set_commentable
      @commentable = Post.find(params[:post_id])
    end
    def set_comment
      @comment = current_user.comments.find(params[:id])
    end
end
