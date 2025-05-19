class Post < ApplicationRecord
  mount_uploader :picture, PostPictureUploader
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 300 }
end
