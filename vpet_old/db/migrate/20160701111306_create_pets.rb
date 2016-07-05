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
      t.integer :strength
      t.integer :defense
      t.timestamp :age
      t.references :user, index: true, foreign_key: true
      t.references :highscore, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
