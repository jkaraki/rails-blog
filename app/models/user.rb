class User < ApplicationRecord
  has_many :posts
  has_many :comments
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password, :notice => "should match confirmation"

  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "passwords should match", if: :password

end
