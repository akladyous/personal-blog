class CommentsController < ApplicationController
  before_action :authenticate_user!

  # def new
  # end

  def create
    # debugger
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
          format.html { redirect_to @commentable }
          format.turbo_stream
      else
          format.html { redirect_to @commentable, alert: 'Comment could not be created' }
          format.turbo_stream
      end
    end
  end

  def destroy
    @comment = @commentable.comments.find(comment_params)
    @comment.destroy
    redirect_back_or_to root_path
  end

  protected
  def comment_params
    params.require(:comment).permit(:content)
  end
end
