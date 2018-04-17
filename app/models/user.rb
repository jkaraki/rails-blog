class User < ApplicationRecord
  has_many :posts
  has_many :comments
  authenticates_with_sorcery!
  #validates :email, :username, presence: true
  validates_confirmation_of :password, message: "passwords should match", if: :password

end
