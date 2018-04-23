class PostsController < ApplicationController
  include PostsHelper

  # redirects to root if not logged in when going to posts/new.
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    # Reverses posts so they show from newest (top) to oldest (bottom)
    @posts = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    puts '*******************************'
    puts params.inspect
    puts '*******************************'
    @post = Post.new
  end

  def create
    # puts '*******************************'
    # puts params.inspect
    # puts '*******************************'
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    @post.save
    flash.notice = "Your post titled '#{@post.title}' has been created!"
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    flash.notice = "Your post titled '#{@post.title}' has been updated!"

    redirect_to post_path(@post)
  end

  #To delete post and associated image
  def destroy
    # puts '************************'
    # puts params.inspect
    # puts '************************'
    @post = Post.find(params[:id])
    # @image = @post.image
    # @image.destroy
    @post.destroy
    flash.notice = "Your post titled '#{@post.title}' has been deleted!"
    redirect_to posts_path
  end

  def destroy_image
    @post = Post.find(params[:id])
    @image = @post.image
    @image.destroy
    redirect_to edit_post_path(@post)
  end
end
