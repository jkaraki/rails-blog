class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.save
    flash.notice = "Your comment has been posted!"
    redirect_to post_path(@comment.post)
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
