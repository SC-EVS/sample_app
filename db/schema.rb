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

ActiveRecord::Schema.define(version: 20140524140458) do

  create_table "backlog_items", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "item_type"
    t.string   "item_title"
    t.string   "item_state"
    t.text     "item_description"
    t.date     "item_deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_url"
    t.string   "user_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "project_story"
    t.integer  "user_id"
  end

  create_table "sprint_backlog_items", force: true do |t|
    t.integer  "backlog_item_id"
    t.integer  "user_id"
    t.string   "activity"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "subtask_description"
  end

  create_table "sprint_teams", force: true do |t|
    t.integer  "backlog_item_id"
    t.integer  "sprint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sprints", force: true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.date     "datestart"
    t.date     "dateend"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
