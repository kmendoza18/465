class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :g_name
      t.string :g_des
      t.integer :money
      t.references :pet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
