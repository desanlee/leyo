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

ActiveRecord::Schema.define(:version => 20121205000855) do

  create_table "followedlocales", :force => true do |t|
    t.integer  "user_id"
    t.integer  "locale_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "followedlocales", ["user_id", "created_at"], :name => "index_followedlocales_on_user_id_and_created_at"

  create_table "locales", :force => true do |t|
    t.integer  "localetype"
    t.string   "localename"
    t.string   "parent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "micropictures", :force => true do |t|
    t.integer  "micropost_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "type"
    t.integer  "owner"
    t.string   "parent"
    t.string   "endpoint"
    t.string   "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "infoname"
    t.string   "infotype"
    t.string   "startpoint"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "microposts", ["owner", "parent", "created_at"], :name => "index_microposts_on_owner_and_parent_and_created_at"

  create_table "noterelationships", :force => true do |t|
    t.integer  "notetrack_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "notetracks", :force => true do |t|
    t.integer  "note_id"
    t.string   "startpoint"
    t.string   "terminal"
    t.integer  "positionindex"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "planrelationships", :force => true do |t|
    t.integer  "micropost_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "positionindex"
    t.integer  "traveltrack_id"
  end

  add_index "planrelationships", ["micropost_id"], :name => "index_planrelationships_on_micropost_id"

  create_table "travelnotes", :force => true do |t|
    t.string   "notename"
    t.integer  "owner"
    t.string   "locale"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "travelplans", :force => true do |t|
    t.string   "planname"
    t.integer  "owner"
    t.string   "locale"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "traveltracks", :force => true do |t|
    t.integer  "plan_id"
    t.string   "startpoint"
    t.string   "terminal"
    t.integer  "positionindex"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => ""
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
