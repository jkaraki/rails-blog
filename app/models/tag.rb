class Tag < ApplicationRecord
  has_many :taggings
  # join table association for posts and tags relationship
  has_many :posts, through: :taggings, :dependent => :destroy

  def to_s
    name
  end
end
