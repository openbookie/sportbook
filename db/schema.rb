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

  create_table "actions", :force => true do |t|
    t.text     "text"
    t.string   "tmpl"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "pool_id"
    t.integer  "game_id"
    t.integer  "tip_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_quotes", :force => true do |t|
    t.integer  "service_id", :null => false
    t.integer  "event_id",   :null => false
    t.integer  "team_id",    :null => false
    t.decimal  "odds",       :null => false
    t.string   "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title",                        :null => false
    t.string   "key",                          :null => false
    t.boolean  "team3",      :default => true, :null => false
    t.datetime "start_at",                     :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "events", ["key"], :name => "index_events_on_key", :unique => true

  create_table "events_teams", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "events_teams", ["event_id", "team_id"], :name => "index_events_teams_on_event_id_and_team_id", :unique => true
  add_index "events_teams", ["event_id"], :name => "index_events_teams_on_event_id"

  create_table "games", :force => true do |t|
    t.integer  "round_id",                        :null => false
    t.integer  "pos",                             :null => false
    t.integer  "group_id"
    t.integer  "team1_id",                        :null => false
    t.integer  "team2_id",                        :null => false
    t.datetime "play_at",                         :null => false
    t.boolean  "knockout",     :default => false, :null => false
    t.boolean  "home",         :default => true,  :null => false
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "score5"
    t.integer  "score6"
    t.integer  "next_game_id"
    t.integer  "prev_game_id"
    t.string   "toto12x"
    t.string   "key"
    t.string   "type"
    t.boolean  "calc",         :default => false, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "games", ["group_id"], :name => "index_games_on_group_id"
  add_index "games", ["key"], :name => "index_games_on_key", :unique => true
  add_index "games", ["next_game_id"], :name => "index_games_on_next_game_id"
  add_index "games", ["prev_game_id"], :name => "index_games_on_prev_game_id"
  add_index "games", ["round_id"], :name => "index_games_on_round_id"

  create_table "group_quotes", :force => true do |t|
    t.integer  "service_id", :null => false
    t.integer  "group_id",   :null => false
    t.integer  "team_id",    :null => false
    t.decimal  "odds",       :null => false
    t.string   "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.string   "title",      :null => false
    t.integer  "pos",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["event_id"], :name => "index_groups_on_event_id"

  create_table "groups_teams", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups_teams", ["group_id", "team_id"], :name => "index_groups_teams_on_group_id_and_team_id", :unique => true
  add_index "groups_teams", ["group_id"], :name => "index_groups_teams_on_group_id"

  create_table "plays", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "pool_id",                   :null => false
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "team3_id"
    t.integer  "total_pts",  :default => 0, :null => false
    t.integer  "total_pos",  :default => 0, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "plays", ["pool_id"], :name => "index_plays_on_pool_id"
  add_index "plays", ["user_id", "pool_id"], :name => "index_plays_on_user_id_and_pool_id", :unique => true
  add_index "plays", ["user_id"], :name => "index_plays_on_user_id"

  create_table "points", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "pool_id",                       :null => false
    t.integer  "round_id",                      :null => false
    t.integer  "round_pts",      :default => 0, :null => false
    t.integer  "round_pos",      :default => 0, :null => false
    t.integer  "total_pts",      :default => 0, :null => false
    t.integer  "total_pos",      :default => 0, :null => false
    t.integer  "diff_total_pos", :default => 0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "points", ["user_id", "pool_id", "round_id"], :name => "index_points_on_user_id_and_pool_id_and_round_id", :unique => true

  create_table "pools", :force => true do |t|
    t.integer  "event_id",                        :null => false
    t.string   "title",                           :null => false
    t.integer  "user_id",                         :null => false
    t.boolean  "fix",          :default => false, :null => false
    t.boolean  "public",       :default => true,  :null => false
    t.text     "welcome"
    t.text     "welcome_html"
    t.string   "key"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "pools", ["event_id"], :name => "index_pools_on_event_id"
  add_index "pools", ["key"], :name => "index_pools_on_key", :unique => true
  add_index "pools", ["user_id"], :name => "index_pools_on_user_id"

  create_table "props", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quotes", :force => true do |t|
    t.integer  "service_id", :null => false
    t.integer  "game_id",    :null => false
    t.decimal  "odds1",      :null => false
    t.decimal  "oddsx",      :null => false
    t.decimal  "odds2",      :null => false
    t.string   "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.integer  "event_id",                      :null => false
    t.string   "title",                         :null => false
    t.string   "title2"
    t.integer  "pos",                           :null => false
    t.boolean  "playoff",    :default => false, :null => false
    t.boolean  "flex",       :default => true,  :null => false
    t.boolean  "fix",        :default => true,  :null => false
    t.string   "type"
    t.boolean  "calc",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "rounds", ["event_id"], :name => "index_rounds_on_event_id"

  create_table "services", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "key",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "title",                           :null => false
    t.string   "key",                             :null => false
    t.string   "img"
    t.string   "tag"
    t.string   "type"
    t.boolean  "calc",         :default => false, :null => false
    t.string   "calc_rule"
    t.string   "calc_value"
    t.integer  "calc_team_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "teams", ["key"], :name => "index_teams_on_key", :unique => true

  create_table "tips", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.integer  "pool_id",                          :null => false
    t.integer  "game_id",                          :null => false
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "score5"
    t.integer  "score6"
    t.string   "toto12x"
    t.string   "type"
    t.boolean  "calc",          :default => false, :null => false
    t.integer  "calc_team1_id"
    t.integer  "calc_team2_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "tips", ["game_id"], :name => "index_tips_on_game_id"
  add_index "tips", ["pool_id"], :name => "index_tips_on_pool_id"
  add_index "tips", ["user_id", "pool_id", "game_id"], :name => "index_tips_on_user_id_and_pool_id_and_game_id", :unique => true
  add_index "tips", ["user_id"], :name => "index_tips_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "email",           :null => false
    t.string   "password_digest"
    t.string   "key"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["key"], :name => "index_users_on_key", :unique => true

end
