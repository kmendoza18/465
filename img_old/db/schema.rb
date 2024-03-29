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

ActiveRecord::Schema.define(version: 20160627184757) do

  create_table "image_users", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_users", ["image_id"], name: "index_image_users_on_image_id"
  add_index "image_users", ["user_id"], name: "index_image_users_on_user_id"

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.boolean  "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "str"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["image_id"], name: "index_tags_on_image_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
