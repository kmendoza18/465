class AddNewtimeToPets < ActiveRecord::Migration
  def change
    add_column :pets, :newtime, :timestamp
  end
end
