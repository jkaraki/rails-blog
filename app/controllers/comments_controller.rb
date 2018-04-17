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

  def destroy
    # puts '************************'
    # puts params.inspect
    # puts '************************'
    # @comment = Post.find(params[:id])
    # # @image = @post.image
    # # @image.destroy
    # @comment.destroy
    # flash.notice = "Your post comment has been deleted!"
    # redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body, :created_at, :post_id, :user_id)
  end
end
