class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :creator, index: true, null: false
      t.references :white_player, index: true, null: false
      t.references :black_player, index: true, null: false

      t.timestamps
    end

    add_foreign_key :games, :users, column: :creator_id
    add_foreign_key :games, :users, column: :white_player_id
    add_foreign_key :games, :users, column: :black_player_id
  end
end
