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

ActiveRecord::Schema.define(version: 20180205070856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_merged"
    t.boolean  "is_protected"
    t.boolean  "developers_can_push"
    t.boolean  "developers_can_merge"
    t.integer  "project_id"
    t.string   "last_commit"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "gitlab_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "branch_id"
    t.datetime "on_date"
    t.integer  "no_of_commits", default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["branch_id"], name: "index_gitlab_stats_on_branch_id", using: :btree
    t.index ["project_id"], name: "index_gitlab_stats_on_project_id", using: :btree
    t.index ["user_id"], name: "index_gitlab_stats_on_user_id", using: :btree
  end

  create_table "jira_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "on_date"
    t.integer  "no_of_resolved", default: 0, null: false
    t.integer  "no_of_accepted", default: 0, null: false
    t.integer  "no_of_rejected", default: 0, null: false
    t.integer  "no_of_reopened", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["project_id"], name: "index_jira_stats_on_project_id", using: :btree
    t.index ["user_id"], name: "index_jira_stats_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "pid"
    t.text     "description"
    t.integer  "default_branch_id"
    t.boolean  "is_public"
    t.boolean  "archived"
    t.integer  "visibility_level"
    t.string   "ssh_url"
    t.string   "http_url"
    t.string   "web_url"
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "project_created_at"
    t.datetime "project_last_activity_at"
    t.text     "permissions"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.string   "username"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  create_table "users_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "gitlab_enabled", default: false
    t.boolean  "jira_enabled",   default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["project_id"], name: "index_users_projects_on_project_id", using: :btree
    t.index ["user_id"], name: "index_users_projects_on_user_id", using: :btree
  end

end
