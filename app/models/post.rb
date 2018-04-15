class Post < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  # Using > after the image dimensions will only resize the image if it's larger than 300x300.
  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"]

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
end
