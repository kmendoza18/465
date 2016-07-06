class AddCostToGames < ActiveRecord::Migration
  def change
    add_column :games, :cost, :integer
  end
end
