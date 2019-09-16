class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:name]
  attachment :profile_image
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_books, through: :favorites, source: :book
  has_many :following_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships, source: :follower
  has_many :follower_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :following

  def followed_by?(user)
    follower_relationships.find_by(following_id: user.id).present?
  end

end
