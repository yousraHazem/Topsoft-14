
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140327161619) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140327142651) do

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "description"
    t.string   "photo_name"
    t.string   "photo_type"
  end

  create_table "songs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "artist"
    t.string   "album"
    t.integer  "length"
  end
>>>>>>> 8bf0fb8eaab3e87d4f174266a0e08cfb54cfa72b

=======
>>>>>>> 62d85970fc5313f1786eaa33541c3fd359f911c5

ActiveRecord::Schema.define(version: 20140327111619) do
  create_table "children", force: true do |t|
<<<<<<< HEAD
    t.boolean  "approved"
    t.string   "guardian_email"
=======
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
>>>>>>> 8bf0fb8eaab3e87d4f174266a0e08cfb54cfa72b
    t.string   "user_name"
    t.string   "password"
    t.string   "first_name"
    t.datetime "birth_of_date"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
