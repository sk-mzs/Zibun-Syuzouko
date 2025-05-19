class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post


  validates :name,                presence: true,
                                  length: { maximum: 20 }
  
def like(post)
  like_posts << post
end

def unlike(post)
  like_posts.destroy(post)
end

def like?(post)
  like_posts.include?(post)
end

end
