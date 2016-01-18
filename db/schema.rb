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

ActiveRecord::Schema.define(version: 20160118184604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_rest_filters", force: :cascade do |t|
    t.json     "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "api_rest_games", force: :cascade do |t|
    t.string   "name"
    t.integer  "players_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "api_rest_games_meetings", force: :cascade do |t|
    t.integer "game_id"
    t.integer "meeting_id"
  end

  create_table "api_rest_meetings", force: :cascade do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_rest_meetings_users", force: :cascade do |t|
    t.integer "meeting_id"
    t.integer "user_id"
  end

  create_table "api_rest_users", force: :cascade do |t|
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
