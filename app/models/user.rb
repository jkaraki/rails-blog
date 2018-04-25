class User < ApplicationRecord
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password, :notice => "should match confirmation"

  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "passwords should match", if: :password

end
