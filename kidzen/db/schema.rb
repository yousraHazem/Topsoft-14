
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


ActiveRecord::Schema.define(version: 20140327111619) do
  create_table "children", force: true do |t|
    t.boolean  "is_approved"
    t.integer  "registered_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guardian_email"
  end
 
 create_table "events", force: true do |t|
    t.string   "location"
    t.string   "name"
    t.datetime "date_time"
    t.string   "description"
  end

  create_table "friend_ships", force: true do |t|
    t.integer  "child_1_id"
    t.integer  "child_2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_ships", ["child_1_id", "child_2_id"], name: "index_friend_ships_on_child_1_id_and_child_2_id"

  create_table "notifications", force: true do |t|
    t.time     "sent_in_time"
    t.date     "sent_in_date"
    t.string   "type"
    t.boolean  "checked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  create_table "parent_children", force: true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parent_children", ["parent_id", "child_id"], name: "index_parent_children_on_parent_id_and_child_id"

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
    t.boolean  "banned"
  end

  add_index "registered_users", ["email"], name: "index_registered_users_on_email", unique: true
  add_index "registered_users", ["user_name"], name: "index_registered_users_on_user_name", unique: true

  create_table "supervises_children", force: true do |t|
    t.integer  "supervisor_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supervises_children", ["supervisor_id", "child_id"], name: "index_supervises_children_on_supervisor_id_and_child_id"

end
