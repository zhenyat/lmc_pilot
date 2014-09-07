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

ActiveRecord::Schema.define(version: 20140907184455) do

  create_table "behaviors", force: true do |t|
    t.integer  "competency_id",                null: false
    t.integer  "level_id",                     null: false
    t.text     "content",                      null: false
    t.boolean  "active",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clusters", force: true do |t|
    t.string   "name",                        null: false
    t.string   "title",                       null: false
    t.boolean  "mutual",      default: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clusters", ["name"], name: "index_clusters_on_name", using: :btree

  create_table "competencies", force: true do |t|
    t.integer  "position_id",             null: false
    t.integer  "cluster_id",              null: false
    t.string   "name",                    null: false
    t.string   "title",                   null: false
    t.integer  "rank",        default: 1, null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "number",     null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["number"], name: "index_departments_on_number", using: :btree

  create_table "levels", force: true do |t|
    t.integer  "rank",       null: false
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "levels", ["name"], name: "index_levels_on_name", unique: true, using: :btree
  add_index "levels", ["rank"], name: "index_levels_on_rank", unique: true, using: :btree

  create_table "positions", force: true do |t|
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["name"], name: "index_positions_on_name", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "stores", force: true do |t|
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["name"], name: "index_stores_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer  "role_id",         null: false
    t.string   "login",           null: false
    t.string   "password_digest", null: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end
