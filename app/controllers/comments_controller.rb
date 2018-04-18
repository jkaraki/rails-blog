class CommentsController < ApplicationController

  # before_action :require_login

  def create
    puts '***************************'
    puts params.inspect
    puts '***************************'
    # @user = User.find(params[:id])
    # @username = @user.username
    @comment = Comment.new(comment_params)
    # @comment = Comment.create(comment_params)
    # @post = Post.find(params[:id])
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

  # currently deletes all comments. Need it to only delete one comment. Need to isolate '@comment' instead
  def destroy
    puts '************************'
    puts params.inspect
    puts '************************'
    @post = Post.find(params[:post_id])
    # @post.user_id = session[:user_id]
    # @comments = @post.comments
    @comment = Comment.find(params[:id])
    # @comment.post_id = @post.id

    @comment.destroy
    flash.notice = "Your post comment has been deleted!"
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body, :created_at, :post_id, :user_id, :id)
  end
end
