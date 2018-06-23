class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :ramenpost, foreign_key: true
      t.timestamps
      
      t.index [:user_id, :ramenpost_id], unique: true
    end
  end
end
