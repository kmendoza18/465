class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name
      t.string :game_des
      t.integer :game_prize
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
