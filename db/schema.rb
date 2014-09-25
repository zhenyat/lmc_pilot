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

ActiveRecord::Schema.define(version: 20140919123419) do

  create_table "actioncards", force: true do |t|
    t.integer  "competency_id", null: false
    t.integer  "level_id",      null: false
    t.text     "content",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actioncards", ["competency_id"], name: "index_actioncards_on_competency_id", using: :btree
  add_index "actioncards", ["level_id"], name: "index_actioncards_on_level_id", using: :btree

  create_table "assessments", force: true do |t|
    t.integer  "user_id",                    null: false
    t.boolean  "closed",     default: false, null: false
    t.integer  "max_level",  default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assessments", ["user_id"], name: "index_assessments_on_user_id", using: :btree

  create_table "behaviors", force: true do |t|
    t.integer  "competency_id",                null: false
    t.integer  "level_id",                     null: false
    t.text     "content",                      null: false
    t.boolean  "active",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "behaviors", ["competency_id"], name: "index_behaviors_on_competency_id", using: :btree
  add_index "behaviors", ["level_id"], name: "index_behaviors_on_level_id", using: :btree

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

  add_index "competencies", ["cluster_id"], name: "index_competencies_on_cluster_id", using: :btree
  add_index "competencies", ["position_id"], name: "index_competencies_on_position_id", using: :btree

  create_table "departments", force: true do |t|
    t.string   "number",     null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["number"], name: "index_departments_on_number", using: :btree

  create_table "employees", force: true do |t|
    t.integer  "store_id",                     null: false
    t.integer  "department_id",                null: false
    t.integer  "position_id",                  null: false
    t.integer  "level_id",                     null: false
    t.integer  "manager_id"
    t.string   "last_name",                    null: false
    t.string   "first_name",                   null: false
    t.string   "middle_name",                  null: false
    t.string   "pin",                          null: false
    t.boolean  "active",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["pin"], name: "index_employees_on_pin", unique: true, using: :btree

  create_table "items", force: true do |t|
    t.integer  "assessment_id",                 null: false
    t.integer  "behavior_id",                   null: false
    t.boolean  "user_tick",     default: false, null: false
    t.boolean  "final_tick",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["assessment_id"], name: "index_items_on_assessment_id", using: :btree
  add_index "items", ["behavior_id"], name: "index_items_on_behavior_id", using: :btree

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

  create_table "stores", force: true do |t|
    t.string   "name",                       null: false
    t.string   "title",                      null: false
    t.boolean  "active",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["name"], name: "index_stores_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer  "store_id",                       null: false
    t.integer  "department_id",                  null: false
    t.integer  "position_id",                    null: false
    t.integer  "level_id",                       null: false
    t.integer  "manager_id"
    t.string   "login",                          null: false
    t.string   "last_name",                      null: false
    t.string   "first_name",                     null: false
    t.string   "middle_name",     default: ""
    t.boolean  "active",          default: true, null: false
    t.string   "password_digest",                null: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["level_id"], name: "index_users_on_level_id", using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["position_id"], name: "index_users_on_position_id", using: :btree
  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree

  add_foreign_key "actioncards", "competencies", name: "actioncards_competency_id_fk"
  add_foreign_key "actioncards", "levels", name: "actioncards_level_id_fk"

  add_foreign_key "assessments", "users", name: "assessments_user_id_fk"

  add_foreign_key "behaviors", "competencies", name: "behaviors_competency_id_fk"
  add_foreign_key "behaviors", "levels", name: "behaviors_level_id_fk"

  add_foreign_key "competencies", "clusters", name: "competencies_cluster_id_fk"
  add_foreign_key "competencies", "positions", name: "competencies_position_id_fk"

  add_foreign_key "items", "assessments", name: "items_assessment_id_fk"
  add_foreign_key "items", "behaviors", name: "items_behavior_id_fk"

  add_foreign_key "users", "departments", name: "users_department_id_fk"
  add_foreign_key "users", "levels", name: "users_level_id_fk"
  add_foreign_key "users", "positions", name: "users_position_id_fk"
  add_foreign_key "users", "stores", name: "users_store_id_fk"

end
