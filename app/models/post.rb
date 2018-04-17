class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings
  belongs_to :user
  # has_attached_file :image, :dependent => :destroy

  # Using > after the image dimensions will only resize the image if it's larger than 300x300.
  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]
  before_save :destroy_image?

  def tag_list
    self.tags.collect do |tag|
    tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{ |str| str.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
  end

  def image_delete_with_post
    @post = Post.find(params[:id])
    @image = @post.destroy
  end

  private

  def destroy_image?
    self.image.clear if @image_delete == "1"
  end

end
