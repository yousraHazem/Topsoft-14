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

ActiveRecord::Schema.define(version: 20140324234604) do

  create_table "children", force: true do |t|
    t.boolean  "is_approved"
    t.integer  "registered_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friend_ships", force: true do |t|
    t.integer  "child_1_id"
    t.integer  "child_2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.text     "abilities"
    t.integer  "registered_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registered_users", force: true do |t|
    t.string   "user_name"
    t.boolean  "online"
    t.datetime "last_accessed"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "family_name"
    t.date     "birth_date"
    t.string   "email"
    t.string   "nickname"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gender"
    t.integer  "permission_id"
  end

  add_index "registered_users", ["email"], name: "index_registered_users_on_email", unique: true
  add_index "registered_users", ["user_name"], name: "index_registered_users_on_user_name", unique: true

end
