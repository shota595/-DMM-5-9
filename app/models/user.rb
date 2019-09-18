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

  def self.search(search, way)
    # if search
    #   User.where(['name LIKE ?', "%#{search}%"])
    # else
    #   User.all
    # end
    return self.all unless search
    if way == "1"
      self.where(['name LIKE ?', "#{search}%"])
    elsif way == "2"
      self.where(['name LIKE ?', "%#{search}"])
    elsif way == "3"
      self.where(['name LIKE ?', "#{search}"])
    elsif way == "4"
      self.where(['name LIKE ?', "%#{search}%"])
    end
  end
end
