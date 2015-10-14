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

ActiveRecord::Schema.define(version: 20151014183428) do

  create_table "heartbeats", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "uptime"
    t.float    "cpu_usage"
    t.integer  "mem_total"
    t.integer  "mem_free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "heartbeats", ["server_id"], name: "index_heartbeats_on_server_id"

  create_table "servers", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.string   "ip"
    t.datetime "last_heartbeat"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
