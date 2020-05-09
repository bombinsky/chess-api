class AddCheckToMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :moves, :check, :boolean,  default: false, null: false
    add_column :moves, :mate, :boolean,  default: false, null: false
  end
end
