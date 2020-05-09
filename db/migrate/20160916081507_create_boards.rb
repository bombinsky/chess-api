class CreateBoards < ActiveRecord::Migration[6.0]
  def up
    create_table :boards do |t|
      t.references :game, foreign_key: true, null: false

      fields.each do |field|
        t.integer field
      end

      t.timestamps
    end
  end

  def down
    drop_table :boards
  end

  private

  def fields
    [
      :A1_id,
      :A2_id,
      :A3_id,
      :A4_id,
      :A5_id,
      :A6_id,
      :A7_id,
      :A8_id,
      :B1_id,
      :B2_id,
      :B3_id,
      :B4_id,
      :B5_id,
      :B6_id,
      :B7_id,
      :B8_id,
      :C1_id,
      :C2_id,
      :C3_id,
      :C4_id,
      :C5_id,
      :C6_id,
      :C7_id,
      :C8_id,
      :D1_id,
      :D2_id,
      :D3_id,
      :D4_id,
      :D5_id,
      :D6_id,
      :D7_id,
      :D8_id,
      :E1_id,
      :E2_id,
      :E3_id,
      :E4_id,
      :E5_id,
      :E6_id,
      :E7_id,
      :E8_id,
      :F1_id,
      :F2_id,
      :F3_id,
      :F4_id,
      :F5_id,
      :F6_id,
      :F7_id,
      :F8_id,
      :G1_id,
      :G2_id,
      :G3_id,
      :G4_id,
      :G5_id,
      :G6_id,
      :G7_id,
      :G8_id,
      :H1_id,
      :H2_id,
      :H3_id,
      :H4_id,
      :H5_id,
      :H6_id,
      :H7_id,
      :H8_id
    ]
  end

end
