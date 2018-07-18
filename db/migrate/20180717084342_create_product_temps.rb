class CreateProductTemps < ActiveRecord::Migration[5.1]
  def change
    create_table :product_temps do |t|
      t.string :name
      t.float :price
      t.text :descriptions
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
