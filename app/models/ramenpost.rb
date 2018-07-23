class Ramenpost < ApplicationRecord
  mount_uploader :image, RamenpostImageUploader
  belongs_to :user
  
  validates :user_id,  presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :menu, presence: true, length: { maximum: 20 }
  validates :restaurant_name, presence: true, length: { maximum: 30 }
  validates :image, presence: true
  
  has_many :likes, dependent: :destroy
  has_many :evaluations, dependent: :destroy
end
