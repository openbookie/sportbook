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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120318152924) do

  create_table "events", :force => true do |t|
    t.string   "title",                        :null => false
    t.datetime "start_at"
    t.boolean  "team3",      :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "key"
  end

  create_table "events_teams", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_groups", :force => true do |t|
    t.integer  "event_id",                      :null => false
    t.string   "title",                         :null => false
    t.integer  "pos",                           :null => false
    t.boolean  "calc",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "game_group_id",                    :null => false
    t.integer  "pos",                              :null => false
    t.integer  "team1_id",                         :null => false
    t.integer  "team2_id",                         :null => false
    t.datetime "play_at",                          :null => false
    t.boolean  "knockout",      :default => false, :null => false
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "score5"
    t.integer  "score6"
    t.integer  "next_game_id"
    t.integer  "prev_game_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "pools", :force => true do |t|
    t.integer  "event_id",                      :null => false
    t.string   "title",                         :null => false
    t.integer  "user_id",                       :null => false
    t.boolean  "fix",        :default => false, :null => false
    t.text     "welcome"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "key"
  end

  create_table "pools_users", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "pool_id",                   :null => false
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "team3_id"
    t.integer  "points",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "img"
    t.boolean  "calc",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "key"
  end

  create_table "tips", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "pool_id",    :null => false
    t.integer  "game_id",    :null => false
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "score5"
    t.integer  "score6"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
