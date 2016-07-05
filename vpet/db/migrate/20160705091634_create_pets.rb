class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :sex
      t.integer :health
      t.integer :clean
      t.integer :mood
      t.boolean :status
      t.boolean :asleep
      t.timestamp :age
      t.integer :money
      t.integer :user_id
      t.references :highscore, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
