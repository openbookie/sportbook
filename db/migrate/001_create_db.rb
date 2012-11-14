##
##  NB: Lets use old numbering scheme
##  - add to this line to config/application.rb.
##       config.active_record.timestamped_migrations = false
##

class CreateDb < ActiveRecord::Migration

  def up

    ## fix/todo: add WorldDB::CreateDB.up  - (now called in SportDB::CreateDB.up; remove it there)
    SportDB::CreateDB.up
    SportDB::Market::CreateDB.up

#####################################
## add columns / change tables
####################################

change_table :teams do |t|
  t.string  :img    # relative path for pic e.g. at/20x20/rapid.png

  t.string  :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)
  
  t.boolean     :calc,  :null => false, :default => false    # placeholder team?/needs to get calculated
  t.string      :calc_rule     # e.g. group-winner, group-2nd, game-winner, etc.
  t.string      :calc_value    # e.g. <group_id>, <game_id>, etc.
  t.references  :calc_team     # e.g. optional team_id of "real" team when known
end


change_table :events do |t|
  t.boolean     :team3,    :null => false, :default => true   ## e.g. Champions League has no 3rd place (only 1st and 2nd/final)
end


change_table :rounds do |t|
  
  # to avoid duplicates allow (re)use of rounds for fix/flex pools by default
  #  use :flex => true,  :fix => false   for flex only rounds
  #  use :flex => false, :fix => true    for fix only rounds
  #  use :flex => true,  :fix => true    default use for flex and fix
 
  t.boolean    :flex,  :null => false, :default => true
  t.boolean    :fix,   :null => false, :default => true 

  t.string     :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)

  t.boolean    :calc,  :null => false, :default => false
end

change_table :games do |t|
  t.string     :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)
  t.boolean    :calc,  :null => false, :default => false
end


#####################################
## new tables / create tables
####################################

create_table :users do |t|
  t.string  :name,            :null => false
  t.string  :email,           :null => false
  t.string  :password_digest
  t.string  :key,             :null => false   # import/export key
  t.boolean :admin,           :null => false, :default => false
  t.boolean :guest,           :null => false, :default => false  # read-only access (cannot add tips,join pools,etc.)
  t.boolean :active,          :null => false, :default => true
  t.timestamps
end

add_index :users, :key,   :unique => true 
add_index :users, :email, :unique => true   # make email unique


create_table :pools do |t|
  t.references  :event,  :null => false
  t.string      :title,  :null => false
  t.references  :user,   :null => false  # owner/manager/admin of pool
  t.boolean     :fix,    :null => false, :default => false
  t.boolean     :public, :null => false, :default => true   # make all tips public (not private/secret)
  t.boolean     :locked, :null => false, :default => false
  t.text        :welcome
  t.text        :welcome_html
  t.string      :key   # import/export key  
  t.timestamps
end

add_index :pools, :key,   :unique => true 
add_index :pools, :event_id
add_index :pools, :user_id


create_table :plays do |t|
  t.references :user, :null => false
  t.references :pool, :null => false
  t.references :team1   # winner (1st)
  t.references :team2   # runnerup (2nd)
  t.references :team3   # 2n runnerup (3nd)

  t.integer    :total_pts, :null => false, :default => 0   # cached total player points 
  t.integer    :total_pos, :null => false, :default => 0   # cached total ranking/position 

  t.timestamps
end

add_index :plays, [:user_id,:pool_id], :unique => true  # enforce only one play per user and pool
add_index :plays, :user_id
add_index :plays, :pool_id


create_table :tips do |t|
  t.references :user, :null => false
  t.references :pool, :null => false
  t.references :game, :null => false
  t.integer    :score1
  t.integer    :score2
  t.integer    :score3    # verlaengerung (opt)
  t.integer    :score4
  t.integer    :score5    # elfmeter (opt)
  t.integer    :score6
  t.string     :toto12x      # 1,2,X,nil  calculate on save

  t.string     :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)
  t.boolean     :calc,  :null => false, :default => false
  t.references  :calc_team1   # optional ref for team1 guess from user
  t.references  :calc_team2   # optional ref for team2 guess from user

  t.timestamps
end

add_index :tips, [:user_id,:pool_id,:game_id], :unique => true 
add_index :tips, :user_id
add_index :tips, :pool_id
add_index :tips, :game_id



create_table :points do |t|
  t.references :user,  :null => false
  t.references :pool,  :null => false
  t.references :round, :null => false
  
  t.integer    :round_pts, :null => false, :default => 0   # points for this round
  t.integer    :round_pos, :null => false, :default => 0   # ranking/position for this round

  t.integer    :total_pts, :null => false, :default => 0   # total points up to(*) this round (including)  (* rounds sorted by pos)
  t.integer    :total_pos, :null => false, :default => 0   # ranking/position for points up to this round

  t.integer    :diff_total_pos, :null => false, :default => 0
  
  t.timestamps
end

add_index :points, [:user_id,:pool_id,:round_id], :unique => true 



create_table :bonus_rounds do |t|
  t.references :pool,   :null => false
  t.string     :title,  :null => false
  t.integer    :pos,     :null => false
  t.timestamps
end

create_table :bonus_questions do |t|
  t.references :round,  :null => false
  t.string     :title,  :null => false
  t.integer    :pos,    :null => false
  t.timestamps
end
    
create_table :bonus_answers do |t|
  # to be done
  t.timestamps
end
    
create_table :bonus_tips do |t|
  t.references :user,     :null => false
  t.references :question, :null => false
  t.integer    :pts     , :null => false, :default => 0
  t.timestamps
end

create_table :bonus_points do |t|
  t.references :user,  :null => false
  t.references :pool,  :null => false  ## todo: check if we keep reference to pool (because round_id depends itself on pool)
  t.references :round, :null => false   # nb: is bonus_round_id
  
  t.integer    :round_pts, :null => false, :default => 0   # points for this round
  t.integer    :round_pos, :null => false, :default => 0   # ranking/position for this round

  t.integer    :total_pts, :null => false, :default => 0   # total points up to(*) this round (including)  (* rounds sorted by pos)
  t.integer    :total_pos, :null => false, :default => 0   # ranking/position for points up to this round

  t.integer    :diff_total_pos, :null => false, :default => 0
  
  t.timestamps
end

add_index :bonus_points, [:user_id,:pool_id,:round_id], :unique => true


## todo: use polymorphic assoc?? for actions??
##  what references to include?

create_table :actions do |t|
  t.text       :text
  t.string     :tmpl  # template??
  t.references :user
  t.references :event
  t.references :pool
  t.references :game
  t.references :tip
  t.timestamps
end


#### todo: add posts or comments table


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
   Prop.create!( :key => 'db.schema.sportbook.version', :value => '1' )

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end