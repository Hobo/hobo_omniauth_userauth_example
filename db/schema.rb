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

ActiveRecord::Schema.define(:version => 20121205195641) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider",      :null => false
    t.string   "uid",           :null => false
    t.string   "email_address"
    t.string   "name"
    t.string   "nickname"
    t.string   "location"
    t.string   "image"
    t.text     "description"
    t.string   "phone"
    t.text     "urls"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "authorizations", ["email_address"], :name => "index_authorizations_on_email_address"
  add_index "authorizations", ["provider"], :name => "index_authorizations_on_provider"
  add_index "authorizations", ["uid"], :name => "index_authorizations_on_uid"
  add_index "authorizations", ["user_id"], :name => "index_authorizations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",                                                        :null => false
  end

  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true

end
