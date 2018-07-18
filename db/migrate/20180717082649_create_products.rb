class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :descriptions
      t.references :category, foreign_key: true
      t.integer :average_point

      t.timestamps
    end
  end
end
