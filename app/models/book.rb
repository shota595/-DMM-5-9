class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search, way)
    # if search
    #   User.where(['name LIKE ?', "%#{search}%"])
    # else
    #   User.all
    # end
    if way == "1"
      self.where(['title LIKE ?', "#{search}%"])
    elsif way == "2"
      self.where(['title LIKE ?', "%#{search}"])
    elsif way == "3"
      self.where(['title LIKE ?', "#{search}"])
    elsif way == "4"
      self.where(['title LIKE ?', "%#{search}%"])
    end
  end
end
