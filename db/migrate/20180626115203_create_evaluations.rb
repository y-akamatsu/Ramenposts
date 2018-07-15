class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :user, foreign_key: true
      t.references :ramenpost, foreign_key: true
      t.integer :star, default: 0
      t.timestamps
      
      t.index [:user_id, :ramenpost_id], unique: true
    end
  end
end

