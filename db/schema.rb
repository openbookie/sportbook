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

ActiveRecord::Schema.define(:version => 20120305214015) do

  create_table "game_groups", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "pos",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "game_group_id", :null => false
    t.integer  "pos",           :null => false
    t.integer  "team1_id",      :null => false
    t.integer  "team2_id",      :null => false
    t.datetime "play_at",       :null => false
    t.integer  "score1"
    t.integer  "score2"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pools", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pools_users", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "pool_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "img"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tips", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "pool_id",    :null => false
    t.integer  "game_id",    :null => false
    t.integer  "score1"
    t.integer  "score2"
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
