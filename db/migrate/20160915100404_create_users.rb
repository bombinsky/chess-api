class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      t.string :email, null: false
      t.string :nickname, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :nickname, unique: true
  end
end
