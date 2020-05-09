class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.references :game, foreign_key: true, null: false
      t.references :chessman, foreign_key: true, null: false
      t.integer :taken_id
      t.string :from, null: false, limit: 2
      t.string :to, null: false, limit: 2

      t.datetime :created_at, null: false
    end

    add_index :moves, :taken_id
    add_foreign_key :moves, :chessmen, column: :taken_id

  end
end
