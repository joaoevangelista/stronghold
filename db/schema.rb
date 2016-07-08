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

ActiveRecord::Schema.define(version: 20160708051621) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "notify"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "foos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_types", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "is_resolved"
    t.integer  "user_id"
    t.date     "due_date"
    t.integer  "assignee_id"
    t.integer  "issue_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["issue_type_id"], name: "index_issues_on_issue_type_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "reads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "announcement_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["announcement_id"], name: "index_reads_on_announcement_id"
    t.index ["user_id"], name: "index_reads_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_votes_on_issue_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
