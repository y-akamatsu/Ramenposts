class CreateRamenposts < ActiveRecord::Migration[5.0]
  def change
    create_table :ramenposts do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :restaurant_name
      t.string :menu
      t.string :image

      t.timestamps
    end
  end
end
