class CreateImageUsers < ActiveRecord::Migration
  def change
    create_table :image_users do |t|
      t.string :image_id
      t.string :user_id
      t.references :user, index: true
      t.references :image, index: true

      t.timestamps
    end
  end
end
