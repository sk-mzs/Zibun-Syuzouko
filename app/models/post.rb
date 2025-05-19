class Post < ApplicationRecord
  mount_uploader :picture, PostPictureUploader
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 300 }

  def self.ransackable_associations(auth_object = nil)
    ["likes", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end
end
