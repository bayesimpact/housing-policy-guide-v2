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

ActiveRecord::Schema.define(version: 20140817212836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_links", force: true do |t|
    t.string   "url",         null: false
    t.string   "name",        null: false
    t.text     "description"
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

  create_table "data_group_datasets", force: true do |t|
    t.integer  "data_group_id", null: false
    t.integer  "dataset_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_group_policies", force: true do |t|
    t.integer  "data_group_id", null: false
    t.integer  "policy_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_groups", force: true do |t|
    t.string   "name",                           null: false
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_super_group", default: false, null: false
  end

  create_table "dataset_policies", force: true do |t|
    t.integer  "dataset_id", null: false
    t.integer  "policy_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datasets", force: true do |t|
    t.string   "name",                 null: false
    t.text     "source_description"
    t.text     "notes"
    t.text     "visualization_iframe"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "chart_title"
  end

  create_table "policies", force: true do |t|
    t.string   "name",                null: false
    t.text     "summary"
    t.text     "description"
    t.text     "organization_text"
    t.text     "resources_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_image_url"
    t.string   "masthead_image_url"
  end

  create_table "policy_action_links", force: true do |t|
    t.integer  "policy_id",      null: false
    t.integer  "action_link_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
