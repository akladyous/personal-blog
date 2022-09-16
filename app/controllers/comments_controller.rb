class CommentsController < ApplicationController
  before_action :authenticate_user!

  # def new
  # end

  def create
    @comment = ------.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to ------ }
        format.turbo_stream
      end
    else
      redirect_to ------, alert: 'Comment could not be created'
    end
  end

  def destroy
    @comment = ------.comments.find(comment_params)
    @comment.destroy
    redirect_back_or_to root_path
  end

  protected
  def comment_params
    params.require(:comment).permit(:content)
  end
end
