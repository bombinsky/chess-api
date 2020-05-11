# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2016_10_19_120911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.integer "A1_id"
    t.integer "A2_id"
    t.integer "A3_id"
    t.integer "A4_id"
    t.integer "A5_id"
    t.integer "A6_id"
    t.integer "A7_id"
    t.integer "A8_id"
    t.integer "B1_id"
    t.integer "B2_id"
    t.integer "B3_id"
    t.integer "B4_id"
    t.integer "B5_id"
    t.integer "B6_id"
    t.integer "B7_id"
    t.integer "B8_id"
    t.integer "C1_id"
    t.integer "C2_id"
    t.integer "C3_id"
    t.integer "C4_id"
    t.integer "C5_id"
    t.integer "C6_id"
    t.integer "C7_id"
    t.integer "C8_id"
    t.integer "D1_id"
    t.integer "D2_id"
    t.integer "D3_id"
    t.integer "D4_id"
    t.integer "D5_id"
    t.integer "D6_id"
    t.integer "D7_id"
    t.integer "D8_id"
    t.integer "E1_id"
    t.integer "E2_id"
    t.integer "E3_id"
    t.integer "E4_id"
    t.integer "E5_id"
    t.integer "E6_id"
    t.integer "E7_id"
    t.integer "E8_id"
    t.integer "F1_id"
    t.integer "F2_id"
    t.integer "F3_id"
    t.integer "F4_id"
    t.integer "F5_id"
    t.integer "F6_id"
    t.integer "F7_id"
    t.integer "F8_id"
    t.integer "G1_id"
    t.integer "G2_id"
    t.integer "G3_id"
    t.integer "G4_id"
    t.integer "G5_id"
    t.integer "G6_id"
    t.integer "G7_id"
    t.integer "G8_id"
    t.integer "H1_id"
    t.integer "H2_id"
    t.integer "H3_id"
    t.integer "H4_id"
    t.integer "H5_id"
    t.integer "H6_id"
    t.integer "H7_id"
    t.integer "H8_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "chessmen", force: :cascade do |t|
    t.string "type", null: false
    t.string "color", null: false
    t.string "symbol", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.bigint "white_player_id", null: false
    t.bigint "black_player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "mate", default: false, null: false
    t.boolean "stalemate", default: false, null: false
    t.index ["black_player_id"], name: "index_games_on_black_player_id"
    t.index ["creator_id"], name: "index_games_on_creator_id"
    t.index ["white_player_id"], name: "index_games_on_white_player_id"
  end

  create_table "moves", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "chessman_id", null: false
    t.integer "taken_id"
    t.string "from", limit: 2
    t.string "to", limit: 2, null: false
    t.datetime "created_at", null: false
    t.boolean "check", default: false, null: false
    t.boolean "mate", default: false, null: false
    t.string "captured", limit: 2
    t.integer "special_type"
    t.index ["chessman_id"], name: "index_moves_on_chessman_id"
    t.index ["game_id"], name: "index_moves_on_game_id"
    t.index ["taken_id"], name: "index_moves_on_taken_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "nickname", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

  add_foreign_key "boards", "games"
  add_foreign_key "games", "users", column: "black_player_id"
  add_foreign_key "games", "users", column: "creator_id"
  add_foreign_key "games", "users", column: "white_player_id"
  add_foreign_key "moves", "chessmen"
  add_foreign_key "moves", "chessmen", column: "taken_id"
  add_foreign_key "moves", "games"
end
