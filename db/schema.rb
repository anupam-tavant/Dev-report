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

ActiveRecord::Schema.define(version: 20180203092127) do

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

  create_table "projects", force: :cascade do |t|
    t.integer  "pid"
    t.text     "description"
    t.integer  "default_branch_id"
    t.boolean  "is_public"
    t.boolean  "archived"
    t.integer  "visibility_level"
    t.string   "ssh_url_to_repo"
    t.string   "http_url_to_repo"
    t.string   "web_url"
    t.string   "name"
    t.string   "name_with_namespace"
    t.string   "path"
    t.string   "path_with_namespace"
    t.boolean  "issues_enabled"
    t.boolean  "merge_requests_enabled"
    t.boolean  "builds_enabled"
    t.boolean  "shared_runners_enabled"
    t.boolean  "lfs_enabled"
    t.integer  "creator_id"
    t.integer  "star_count"
    t.integer  "forks_count"
    t.integer  "open_issues_count"
    t.boolean  "public_builds"
    t.boolean  "only_allow_merge_if_build_succeeds"
    t.boolean  "request_access_enabled"
    t.boolean  "only_allow_merge_if_all_discussions_are_resolved"
    t.datetime "project_created_at"
    t.datetime "project_last_activity_at"
    t.text     "permissions"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
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

end
