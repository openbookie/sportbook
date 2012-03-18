class CreateDb < ActiveRecord::Migration

  # todo: add index for foreign_keys

    ## todo: game_group
    # add "virtual" key field (read-only)
    # -- use pos plus key from event e.g. "#{event.key}#{pos} e.g. euro1"
    
    ## todo: user
    ## add "virtual" key field (read-only)
    #  -- for now use email (shortend??)


  def up
    
create_table :teams do |t|
  t.string  :title, :null => false
  t.string  :key,   :null => false
  t.boolean :calc,  :null => false, :default => false    # placeholder team?/needs to get calculated
  t.string  :img
  t.timestamps
end

create_table :events do |t|
  t.string      :title, :null => false
  t.string      :key,   :null => false
  t.datetime    :start_at   #  :null => false   --todo/fix: make not nullable 
  ## e.g. Champions League has no 3rd place (only 1st and 2nd/final)
  t.boolean :team3, :default => true  ## fix/todo: add :null => false
  t.timestamps  
end

create_table :game_groups do |t|
  t.references :event, :null => false
  t.string     :title, :null => false
  t.integer    :pos,   :null => false
  t.boolean    :calc,  :null => false, :default => false
  t.timestamps
end

create_table :games do |t|
  t.references :game_group, :null => false
  t.integer    :pos,        :null => false
  t.references :team1,      :null => false
  t.references :team2,      :null => false
  t.datetime   :play_at,    :null => false
  t.boolean    :knockout,   :null => false, :default => false
  t.integer    :score1
  t.integer    :score2
  t.integer    :score3    # verlaengerung (opt)
  t.integer    :score4
  t.integer    :score5    # elfmeter (opt)
  t.integer    :score6
  t.references :next_game  # for hinspiel bei rueckspiel in knockout game
  t.references :prev_game
  t.timestamps
end

create_table :users do |t|
  t.string :name, :null => false
  t.string :email
  t.string :password
  t.timestamps
end

create_table :pools do |t|
  t.references  :event, :null => false
  t.string      :title, :null => false
  t.references  :user,  :null => false  # owner/manager/admin of pool
  t.boolean     :fix,   :null => false, :default => false
  t.text        :welcome
  t.string      :key        #  todo/fix: if nil use id plus key from event e.g "#{event.key}#{id} e.g. euro1"
  t.timestamps
end

### fix/todo: rename table to plays
create_table :pools_users do |t|
  t.references :user, :null => false
  t.references :pool, :null => false
  t.references :team1   # winner (1st)
  t.references :team2   # runnerup (2nd)
  t.references :team3   # 2n runnerup (3nd)
  t.integer    :points, :default => 0     # cache players points  
  t.timestamps
end

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
  t.timestamps
end

# todo: remove id from join table? why?? why not??
create_table :events_teams do |t|
  t.references :event, :null => false
  t.references :team,  :null => false
  t.timestamps
end

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end