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

ActiveRecord::Schema.define(version: 20151021201122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_issues", force: :cascade do |t|
    t.string   "stance"
    t.integer  "candidate_id"
    t.integer  "issue_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "goal",         default: 0
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.string   "bio"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "featured",       default: false
    t.string   "last_name"
    t.string   "slug"
    t.string   "twitter_handle"
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "candidate_issue_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "order_id"
  end

  add_index "donations", ["candidate_issue_id"], name: "index_donations_on_candidate_issue_id", using: :btree
  add_index "donations", ["user_id"], name: "index_donations_on_user_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "topic"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "featured",    default: false
    t.string   "picture"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.string   "status",     default: "pending"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       default: "registered_user"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
    t.string   "reason"
  end

  add_index "user_roles", ["candidate_id"], name: "index_user_roles_on_candidate_id", using: :btree
  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "phone_number"
    t.string   "sent_code",       default: "1111"
    t.string   "auth_code",       default: ""
  end

  add_foreign_key "donations", "candidate_issues"
  add_foreign_key "donations", "users"
  add_foreign_key "user_roles", "candidates"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
