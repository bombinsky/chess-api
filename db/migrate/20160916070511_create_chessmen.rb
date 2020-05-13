class CreateChessmen < ActiveRecord::Migration[6.0]
  def change
    create_table :chessmen do |t|
      t.string :type, null: false
      t.string :color, null: false
      t.string :symbol, null: false
    end
  end
end
