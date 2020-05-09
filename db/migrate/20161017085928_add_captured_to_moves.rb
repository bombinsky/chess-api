class AddCapturedToMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :moves, :captured, :string, limit: 2
  end
end
