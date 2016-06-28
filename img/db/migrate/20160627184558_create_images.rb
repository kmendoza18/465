class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.boolean :status
      t.string :user_id

      t.timestamps
    end
  end
end
