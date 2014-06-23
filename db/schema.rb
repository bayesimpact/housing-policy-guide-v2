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

ActiveRecord::Schema.define(version: 20140623010917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_links", force: true do |t|
    t.integer  "policy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "data_groups", force: true do |t|
    t.integer  "data_groups_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_groups_data_sets", force: true do |t|
    t.integer  "data_group_id", null: false
    t.integer  "data_set_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_groups_policies", force: true do |t|
    t.integer  "data_group_id", null: false
    t.integer  "policy_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasets", force: true do |t|
    t.text     "source_description"
    t.text     "notes"
    t.string   "visualization_url"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasets_policies", force: true do |t|
    t.integer  "dataset_id", null: false
    t.integer  "policy_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "policies", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.text     "organization_text"
    t.text     "resources_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
