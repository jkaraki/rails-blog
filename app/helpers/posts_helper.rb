module PostsHelper
  def post_params
    params.require(:post).permit(:title, :body, :tag_list, :image, :image_delete, :image_content_type, :image_file_size, :image_updated_at, :image_id, :comments, :user_id)
  end
end
