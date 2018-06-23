class User < ApplicationRecord
  mount_uploader :image, UserImageUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                     uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :ramenposts, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_posts,through: :likes, source: :ramenpost

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def like(ramenpost)
   self.likes.find_or_create_by(ramenpost_id: ramenpost.id)
  end
  
  def unlike(ramenpost)
   like = self.likes.find_by(ramenpost_id: ramenpost.id)
   like.destroy if like
  end
  
  def liking?(ramenpost)
    self.like_posts.include?(ramenpost)
  end
end