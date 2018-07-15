class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :ramenpost
  
  validates :user_id, presence: true
  validates :ramenpost_id, presence: true
  validates :star,  inclusion: { in: 0..5 }
end
