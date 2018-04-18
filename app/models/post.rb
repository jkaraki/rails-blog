class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  belongs_to :user
  # has_attached_file :image, :dependent => :destroy

  # To resize the image. I'm using the '>' after the image dimensions will only resize the image if it's larger than 300x300.
  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  before_save :destroy_image?

  # When creating a new post, there is a field for entering tags. The below collects the tags which were seperated by a comma when entered.
  def tag_list
    self.tags.collect do |tag|
    tag.name
    end.join(", ")
  end

  # It then splits them by the commas, strips the duplicates, and makes them lowercase.
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{ |str| str.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  # The below three actions create functionality to delete an image by checking a box when editing the post.
  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
  end

  # Action to delete the image with the post when the post is deleted.
  def image_delete_with_post
    @post = Post.find(params[:id])
    @image = @post.destroy
  end

  private

  def destroy_image?
    self.image.clear if @image_delete == "1"
  end

end
