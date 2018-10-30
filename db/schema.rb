# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_30_092152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "area", null: false
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_areas_on_game_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "game_id"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title", limit: 500, default: "", null: false
    t.text "content", default: "", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "the_day", null: false
    t.string "file"
    t.string "place", limit: 500, default: "", null: false
    t.integer "price"
    t.text "remark"
    t.text "note"
  end

  create_table "labelings", force: :cascade do |t|
    t.integer "game_id"
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.integer "game_id"
    t.string "game_lebel"
    t.string "game_size"
    t.string "game_event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "open_areas", force: :cascade do |t|
    t.integer "game_id"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.string "kana_name", default: "", null: false
    t.integer "gender"
    t.string "icon"
    t.integer "live"
    t.string "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "games"
  add_foreign_key "games", "users"
end
