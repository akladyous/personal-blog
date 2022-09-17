class CommentsController < ApplicationController
  before_action :authenticate_user!

  # def new
  # end

  def create
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
    @comment = @commentable.comments.find(params.permit(:id)[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back_or_to root_path }
      format.turbo_stream
    end
  end

  protected
    def comment_params
      params.require(:comment).permit(:content)
    end
end
