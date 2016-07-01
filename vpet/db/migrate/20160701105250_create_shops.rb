class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :item_name
      t.string :item_des
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
