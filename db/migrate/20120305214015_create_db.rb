class CreateDb < ActiveRecord::Migration

  def up
    
create_table :teams do |t|
  t.string  :title, :null => false
  t.string  :key,   :null => false   # import/export key
  t.string  :img
  t.string  :tag     # make it not null?  - three letter tag (short title)

  t.string  :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)
  
  t.boolean :calc,  :null => false, :default => false    # placeholder team?/needs to get calculated
  t.string  :calc_rule     # e.g. group-winner, group-2nd, game-winner, etc.
  t.string  :calc_value    # e.g. <group_id>, <game_id>, etc.
  t.string  :calc_team_id  # e.g. optional team_id of "real" team when known

  t.timestamps
end

add_index :teams, :key, :unique => true


create_table :events do |t|
  t.string      :title,   :null => false
  t.string      :key,     :null => false   # import/export key
  t.boolean     :team3,   :null => false, :default => true   ## e.g. Champions League has no 3rd place (only 1st and 2nd/final)
  t.datetime    :start_at   #  :null => false   --todo/fix: make not nullable 
  t.timestamps  
end

add_index :events, :key, :unique => true 


create_table :rounds do |t|
  t.references :event, :null => false
  t.string     :title, :null => false
  t.string     :title2
  t.integer    :pos,   :null => false

  t.string     :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)

  t.boolean    :calc,  :null => false, :default => false
  
  t.timestamps
end

add_index :rounds, :event_id  # fk event_id index


create_table :groups do |t|     # Teamgruppe (zB Gruppe A, Gruppe B, etc.)
  t.references :event,    :null => false
  t.string     :title,    :null => false
  t.integer    :pos,      :null => false
  t.timestamps
end

add_index :groups, :event_id  # fk event_id index


create_table :games do |t|
  t.references :round,    :null => false
  t.integer    :pos,      :null => false
  t.references :group      # note: group is optional
  t.references :team1,    :null => false
  t.references :team2,    :null => false
  t.datetime   :play_at,  :null => false
  t.boolean    :knockout, :null => false, :default => false
  t.boolean    :home,     :null => false, :default => true    # is team1 play at home (that is, at its home stadium)
  t.integer    :score1
  t.integer    :score2
  t.integer    :score3    # verlaengerung (opt)
  t.integer    :score4
  t.integer    :score5    # elfmeter (opt)
  t.integer    :score6
  t.references :next_game  # for hinspiel bei rueckspiel in knockout game
  t.references :prev_game
  t.string     :toto12x      # 1,2,X,nil  calculate on save
  t.string     :key          # import/export key
  t.timestamps
end

add_index :games, :key, :unique => true 
add_index :games, :round_id      # fk round_id index
add_index :games, :group_id      # fk group_id index
add_index :games, :next_game_id  # fk next_game_id index
add_index :games, :prev_game_id  # fk next_game_id index


create_table :users do |t|
  t.string :name, :null => false
  t.string :email
  t.string :password
  t.string :key   # import/export key
  t.timestamps
end

add_index :users, :key,   :unique => true 
add_index :users, :email, :unique => true   # make email unique


create_table :pools do |t|
  t.references  :event, :null => false
  t.string      :title, :null => false
  t.references  :user,  :null => false  # owner/manager/admin of pool
  t.boolean     :fix,   :null => false, :default => false
  t.text        :welcome
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
  t.timestamps
end

add_index :tips, [:user_id,:pool_id,:game_id], :unique => true 
add_index :tips, :user_id
add_index :tips, :pool_id
add_index :tips, :game_id


# todo: remove id from join table (without extra fields)? why?? why not??
create_table :events_teams do |t|
  t.references :event, :null => false
  t.references :team,  :null => false
  t.timestamps
end

add_index :events_teams, [:event_id,:team_id], :unique => true 
add_index :events_teams, :event_id


create_table :groups_teams do |t|
  t.references :group, :null => false
  t.references :team,  :null => false
  t.timestamps
end

add_index :groups_teams, [:group_id,:team_id], :unique => true 
add_index :groups_teams, :group_id



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


  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end