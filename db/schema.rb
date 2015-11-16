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

ActiveRecord::Schema.define(version: 20151116165953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "heartbeats", force: :cascade do |t|
    t.integer  "system_id"
    t.string   "uptime"
    t.float    "cpu_usage"
    t.integer  "mem_total"
    t.integer  "mem_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "heartbeats", ["system_id"], name: "index_heartbeats_on_system_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "system_id"
    t.text     "body"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "subject"
  end

  create_table "systems", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
