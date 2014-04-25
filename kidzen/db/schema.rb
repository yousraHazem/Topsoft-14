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

ActiveRecord::Schema.define(version: 20140425212057) do

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

  create_table "child_favourites", force: true do |t|
    t.string "child_name"
    t.string "favourite_name"
  end

  create_table "child_hobbies", force: true do |t|
    t.string "child_name"
    t.string "hobby_name"
  end

  create_table "child_interests", force: true do |t|
    t.string "child_name"
    t.string "interest_name"
  end

  create_table "event_invitations", force: true do |t|
    t.integer  "event_id"
    t.integer  "inviter_id"
    t.integer  "invited_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "location"
    t.string   "name"
    t.datetime "date_time"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "child_name"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "sender"
    t.string   "recepient"
    t.string   "subject"
    t.text     "body"
    t.integer  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification_actions", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "data"
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

  create_table "photos", force: true do |t|
    t.string   "description"
    t.string   "image"
    t.string   "remote_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_answers", force: true do |t|
    t.string   "content"
    t.integer  "counter"
    t.integer  "poll_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_questions", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_musics", force: true do |t|
    t.integer  "user_id"
    t.string   "mp3_url"
    t.string   "youtube_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "description"
    t.string   "category"
    t.string   "file"
    t.string   "real_file"
    t.string   "youtube"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
