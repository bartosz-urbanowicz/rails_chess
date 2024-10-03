# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_26_084237) do
  create_table "games", force: :cascade do |t|
    t.boolean "rated"
    t.boolean "live"
    t.integer "time_base"
    t.integer "time_increment"
    t.integer "result"
    t.text "pgn"
    t.integer "white_player_id"
    t.integer "black_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["black_player_id"], name: "index_games_on_black_player_id"
    t.index ["white_player_id"], name: "index_games_on_white_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "rating", default: 100
    t.integer "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "users", column: "black_player_id"
  add_foreign_key "games", "users", column: "white_player_id"
end
