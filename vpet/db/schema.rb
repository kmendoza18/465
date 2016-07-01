# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160701111823) do

  create_table "games", force: :cascade do |t|
    t.string   "game_name"
    t.string   "game_des"
    t.integer  "game_prize"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "highscores", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "item_name"
    t.integer  "item_effect"
    t.string   "item_des"
    t.integer  "money"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id"

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.boolean  "sex"
    t.integer  "health"
    t.integer  "clean"
    t.integer  "mood"
    t.boolean  "status"
    t.boolean  "asleep"
    t.integer  "strength"
    t.integer  "defense"
    t.datetime "age"
    t.integer  "user_id"
    t.integer  "highscore_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pets", ["highscore_id"], name: "index_pets_on_highscore_id"
  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "shops", force: :cascade do |t|
    t.string   "item_name"
    t.string   "item_des"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shops", ["user_id"], name: "index_shops_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
