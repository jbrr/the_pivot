ActiveRecord::Schema.define(version: 20150930012213) do
  enable_extension "plpgsql"

  create_table "candidate_issues", force: :cascade do |t|
    t.string   "stance"
    t.integer  "candidate_id"
    t.integer  "issue_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.string   "bio"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "featured",   default: false
    t.string   "last_name"
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
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.string   "status",     default: "completed"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "donations", "candidate_issues"
  add_foreign_key "donations", "users"
end
