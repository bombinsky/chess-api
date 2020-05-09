class CreateChessmen < ActiveRecord::Migration[6.0]
  def change
    create_table :chessmen do |t|
      t.string :type, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
