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

ActiveRecord::Schema.define(version: 20160409184159) do

  create_table "cleanlinesses", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "kitchen"
    t.string   "bathroom"
    t.string   "common_space"
    t.integer  "user_id"
  end

  create_table "desired_cleanlinesses", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "kitchen"
    t.string   "bathroom"
    t.string   "common_space"
    t.integer  "user_id"
    t.integer  "kitchen_importance"
    t.integer  "bathroom_importance"
    t.integer  "common_space_importance"
  end

  create_table "desired_habits", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "drinking"
    t.string   "four_twenty"
    t.string   "partying"
    t.string   "overnight_visitors"
    t.string   "music"
    t.integer  "user_id"
    t.integer  "drinking_importance"
    t.integer  "partying_importance"
    t.integer  "music_importance"
    t.integer  "four_twenty_importance"
    t.integer  "overnight_visitors_importance"
  end

  create_table "desired_schedules", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "work"
    t.string   "sleep"
    t.string   "bathroom"
    t.string   "kitchen"
    t.integer  "user_id"
    t.integer  "kitchen_importance"
    t.integer  "bathroom_importance"
    t.integer  "work_importance"
    t.integer  "sleep_importance"
  end

  create_table "habits", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "drinking"
    t.string   "four_twenty"
    t.string   "partying"
    t.string   "overnight_visitors"
    t.string   "music"
    t.integer  "user_id"
  end

  create_table "match_connections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "work"
    t.string   "sleep"
    t.string   "bathroom"
    t.string   "kitchen"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "age"
    t.string   "gender"
    t.text     "dealbreakers"
    t.boolean  "has_apartment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "username"
  end

end
