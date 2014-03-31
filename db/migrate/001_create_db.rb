# encoding: utf-8

##
##  NB: Lets use old numbering scheme
##  - add to this line to config/application.rb.
##       config.active_record.timestamped_migrations = false
##

class CreateDb < ActiveRecord::Migration

  def up

    LogDb.create    # logs table
    ConfDb.create   # props table
    TagDb.create    # tags n taggings table
    ActivityDb::CreateDb.new.up   # todo/fix: change to ActivityDb.create
    WorldDb.create
    SportDb.create
    SportDb::Market.create  #  market quotes

    ## NB: SportDB::Play requires/assumes a table users with col key exists
    
create_table :users do |t|
  t.string  :key,             :null => false   # import/export key
  t.string  :name,            :null => false
  t.string  :email,           :null => false
  t.string  :password_digest
  t.boolean :admin,           :null => false, :default => false
  t.boolean :guest,           :null => false, :default => false  # read-only access (cannot add tips,join pools,etc.)
  t.boolean :active,          :null => false, :default => true
  t.timestamps
end

add_index :users, :key,   :unique => true 
add_index :users, :email, :unique => true   # make email unique
    

    SportDb::Play.create    #  pools, plays, tips, etc. 
    
#####################################
## add columns / change tables
####################################

change_table :teams do |t|
  t.string  :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)

  t.boolean     :calc,  :null => false, :default => false    # placeholder team?/needs to get calculated
  t.string      :calc_rule     # e.g. group-winner, group-2nd, game-winner, etc.
  t.string      :calc_value    # e.g. <group_id>, <game_id>, etc.
  t.references  :calc_team     # e.g. optional team_id of "real" team when known
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
  t.boolean    :calc,   :null => false, :default => false
end


change_table :pools do |t|
  t.boolean     :fix,    :null => false, :default => false
  t.text        :welcome
  t.text        :welcome_html
end


change_table :tips do |t|
  t.string      :type   # NOTE: Rails System Attribute Required for Single-Table Inheritance (STI)
  t.boolean     :calc,  :null => false, :default => false
  t.references  :calc_team1   # optional ref for team1 guess from user
  t.references  :calc_team2   # optional ref for team2 guess from user
end

#####################################
## new tables / create tables
####################################


###############
# fix: remove actions table - replaces by activites from ActivityDb 

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
   Prop.create!( key: 'db.schema.sportbook.version', value: '1' )

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end