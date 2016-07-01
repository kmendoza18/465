class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item_name
      t.integer :item_effect
      t.string :item_des
      t.integer :money
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
