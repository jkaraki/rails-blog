class CommentsController < ApplicationController

  # Not using => before_action :require_login

  # When Comment is created, notice is displayed
  def create
    # puts '***************************'
    # puts params.inspect
    # puts '***************************'
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.username = current_user.username
    if @comment.save
      flash.notice = "Your comment has been posted!"
      redirect_to post_path(@comment.post)
    else
      flash.notice = "Your comment has not been posted!"
      redirect_to post_path(@comment.post)
    end
  end

  def show
    @comments = Comment.all
  end

  # Allows logged in user to delete their own comments
  def destroy
    # puts '************************'
    # puts params.inspect
    # puts '************************'
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.notice = "Your post comment has been deleted!"
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body, :created_at, :post_id, :user_id, :id)
  end
end
