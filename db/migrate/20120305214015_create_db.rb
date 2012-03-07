class CreateDb < ActiveRecord::Migration

  # todo: add index for foreign_keys
  # todo: remove id from join tables? why?? why not??

  def up
    
create_table :teams do |t|
  t.string :title, :null => false
  t.string :img
  t.timestamps
end

create_table :game_groups do |t|
 t.string  :title, :null => false
 t.integer :pos,   :null => false
 t.timestamps
end

create_table :games do |t|
  t.references :game_group, :null => false
  t.integer    :pos,        :null => false
  t.references :team1,      :null => false
  t.references :team2,      :null => false
  t.datetime   :play_at,    :null => false
  t.integer    :score1
  t.integer    :score2
  t.timestamps
end

create_table :users do |t|
  t.string :name, :null => false
  t.string :email
  t.string :password
  t.timestamps
end

create_table :pools do |t|
  t.string :title, :null => false
  t.references :user, :null => false  # owner/manager/admin of pool
  t.timestamps
end

create_table :pools_users do |t|
  t.references :user, :null => false
  t.references :pool, :null => false
  t.timestamps
end

create_table :tips do |t|
  t.references :user, :null => false
  t.references :pool, :null => false
  t.references :game, :null => false
  t.integer    :score1
  t.integer    :score2
  t.timestamps
end

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end