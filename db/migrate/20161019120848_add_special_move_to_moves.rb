class AddSpecialMoveToMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :moves, :special_type, :integer
  end
end
