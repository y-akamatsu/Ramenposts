class Like < ApplicationRecord
  belongs_to :user
  belongs_to :ramenpost
  
  validates :user_id, presence: true
  validates :ramenpost_id, presence: true
  
  def self.ranking
    self.group(:ramenpost_id).order('count_ramenpost_id DESC').limit(10).count(:ramenpost_id)
  end
end
