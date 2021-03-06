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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130128011125) do

  create_table "actions", :force => true do |t|
    t.text     "action"
    t.string   "person_responsible"
    t.integer  "user_id"
    t.integer  "goal_id"
    t.datetime "target_date"
    t.text     "result"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "actions", ["user_id"], :name => "index_actions_on_user_id"

  create_table "barriers", :force => true do |t|
    t.text     "barrier"
    t.text     "intervention"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "barriers", ["user_id"], :name => "index_barriers_on_user_id"

  create_table "clippings", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.integer  "folder_id"
  end

  add_index "clippings", ["folder_id"], :name => "index_clippings_on_folder_id"
  add_index "clippings", ["user_id"], :name => "index_clippings_on_user_id"

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "folders", ["parent_id"], :name => "index_folders_on_parent_id"
  add_index "folders", ["user_id"], :name => "index_folders_on_user_id"

  create_table "goals", :force => true do |t|
    t.string   "goal"
    t.text     "expected_outcome"
    t.date     "target_date"
    t.text     "results"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "goals", ["user_id"], :name => "index_goals_on_user_id"

  create_table "medications", :force => true do |t|
    t.string   "name"
    t.string   "problem"
    t.string   "dosage"
    t.string   "instructions"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "medications", ["user_id"], :name => "index_medications_on_user_id"

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tribe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "problems", :force => true do |t|
    t.string   "problem"
    t.string   "code"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "problems", ["user_id"], :name => "index_problems_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "shared_folders", :force => true do |t|
    t.integer  "user_id"
    t.string   "shared_email"
    t.integer  "shared_user_id"
    t.integer  "folder_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shared_folders", ["folder_id"], :name => "index_shared_folders_on_folder_id"
  add_index "shared_folders", ["shared_user_id"], :name => "index_shared_folders_on_shared_user_id"
  add_index "shared_folders", ["user_id"], :name => "index_shared_folders_on_user_id"

  create_table "tribes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "tribes", ["name"], :name => "index_tribes_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           :default => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
