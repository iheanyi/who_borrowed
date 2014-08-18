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

ActiveRecord::Schema.define(version: 20140818025203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "borrowers", force: true do |t|
    t.string   "name"
    t.string   "facebook_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "borrowers", ["user_id"], name: "index_borrowers_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_friends", force: true do |t|
    t.integer  "user_id_id"
    t.string   "name"
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_friends", ["user_id_id"], name: "index_facebook_friends_on_user_id_id", using: :btree

  create_table "facebook_relationships", force: true do |t|
    t.integer  "user_id_id"
    t.integer  "facebook_friend_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_relationships", ["facebook_friend_id_id"], name: "index_facebook_relationships_on_facebook_friend_id_id", using: :btree
  add_index "facebook_relationships", ["user_id_id"], name: "index_facebook_relationships_on_user_id_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_remote_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "loan_reminders", force: true do |t|
    t.integer  "user_id"
    t.integer  "loan_id"
    t.date     "send_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loan_reminders", ["loan_id"], name: "index_loan_reminders_on_loan_id", using: :btree
  add_index "loan_reminders", ["user_id"], name: "index_loan_reminders_on_user_id", using: :btree

  create_table "loans", force: true do |t|
    t.integer  "borrower_id"
    t.integer  "lender_id"
    t.integer  "item_id"
    t.date     "loaned_on"
    t.datetime "returned_on"
    t.date     "return_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unknown_loan_date", default: false
    t.boolean  "return_whenever",   default: false
    t.boolean  "email_me",          default: true
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
