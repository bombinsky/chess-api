class AddMateAndStalemateToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :mate, :boolean, default: false, null: false
    add_column :games, :stalemate, :boolean, default: false, null: false
  end
end
