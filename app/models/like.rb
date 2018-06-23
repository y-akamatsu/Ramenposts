class Like < ApplicationRecord
  belongs_to :user
  belongs_to :ramenpost
  
  validates :user_id, presence: true
  validates :ramenpost_id, presence: true
end
