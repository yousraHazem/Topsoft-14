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

ActiveRecord::Schema.define(version: 20140420002645) do

  create_table "activities", force: true do |t|
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_tags", force: true do |t|
    t.integer  "activity_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banned_chatroom_members", force: true do |t|
    t.integer  "chatroom_id"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chatroom_logs", force: true do |t|
    t.integer  "chatroom_id"
    t.string   "sender_username"
    t.string   "message_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chatroom_members", force: true do |t|
    t.integer  "chatroom_id"
    t.string   "username"
    t.integer  "creator_accept_state"
    t.integer  "member_accept_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chatrooms", force: true do |t|
    t.string   "chatroom_name"
    t.string   "creator_username"
    t.boolean  "invite_only"
    t.boolean  "mutual_only"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_parents", force: true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "child_parents", ["parent_id", "child_id"], name: "index_child_parents_on_parent_id_and_child_id", unique: true

  create_table "child_supervisors", force: true do |t|
    t.integer  "supervisor_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children", force: true do |t|
    t.boolean  "is_approved"
    t.integer  "registered_user_id"
    t.string   "guardian_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_invitations", force: true do |t|
    t.integer  "event_id"
    t.integer  "inviter_id"
    t.integer  "invited_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "child_1_id"
    t.integer  "child_2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["child_1_id", "child_2_id"], name: "index_friendships_on_child_1_id_and_child_2_id", unique: true

  create_table "group_members", force: true do |t|
    t.integer  "group_id"
    t.string   "username"
    t.integer  "owner_accept_state"
    t.integer  "member_accept_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "owner"
    t.string   "group_name"
    t.string   "privacy"
    t.string   "group_description"
    t.integer  "member_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "title"
    t.string   "sender_username"
    t.string   "receiver_username"
    t.string   "content"
    t.date     "sent_in_date"
    t.time     "sent_in_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification_actions", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.boolean  "async"
    t.integer  "notification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notification_actions", ["notification_id"], name: "index_notification_actions_on_notification_id"

  create_table "notifications", force: true do |t|
    t.string   "assigned_to"
    t.string   "title"
    t.string   "short_desc"
    t.string   "long_desc"
    t.string   "embedded_view_url"
    t.boolean  "pending"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["assigned_to"], name: "index_notifications_on_assigned_to"

  create_table "permissions", force: true do |t|
    t.text     "abilities"
    t.integer  "registered_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "description"
    t.string   "name"
    t.string   "remote_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_answers", force: true do |t|
    t.string   "content"
    t.integer  "counter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poll_question_id"
  end

  create_table "poll_questions", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registered_users", force: true do |t|
    t.string   "username"
    t.boolean  "online"
    t.boolean  "gender"
    t.datetime "last_accessed"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "family_name"
    t.date     "birth_date"
    t.string   "email"
    t.string   "nickname"
    t.string   "password_digest"
    t.boolean  "banned"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registered_users", ["email"], name: "index_registered_users_on_email", unique: true
  add_index "registered_users", ["username"], name: "index_registered_users_on_username", unique: true

  create_table "supervisors", id: false, force: true do |t|
    t.integer  "registered_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supervisors", ["registered_user_id"], name: "index_supervisors_on_registered_user_id", unique: true

  create_table "videos", force: true do |t|
    t.string   "description"
    t.string   "category"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
