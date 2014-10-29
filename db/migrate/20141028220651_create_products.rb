class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :shine
      t.decimal :price
      t.integer :rarity
      t.string :color
      t.integer :faces
      t.string :images

      t.timestamps null: false
    end
  end
end
