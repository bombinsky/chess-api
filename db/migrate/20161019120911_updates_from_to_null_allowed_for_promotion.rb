class UpdatesFromToNullAllowedForPromotion < ActiveRecord::Migration[6.0]
  def change
    change_column_null :moves, :from, true
  end
end
