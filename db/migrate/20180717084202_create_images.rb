class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :product, foreign_key: true
      t.text :image_link

      t.timestamps
    end
  end
end
