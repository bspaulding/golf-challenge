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

ActiveRecord::Schema.define(version: 20130726021712) do

  create_table "achievements", force: true do |t|
    t.string   "key"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bracket_golfers", force: true do |t|
    t.integer  "bracket_id"
    t.integer  "golfer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brackets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "golfer_achievements", force: true do |t|
    t.integer  "golfer_id"
    t.integer  "achievement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "golfer_brackets", force: true do |t|
    t.integer  "golfer_id"
    t.integer  "bracket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "golfers", force: true do |t|
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code"
  end

end
