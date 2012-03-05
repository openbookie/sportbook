class CreateDb < ActiveRecord::Migration

  def up
    
create_table :teams do |t|
  t.string :title, :null => false
  t.timestamps
end

create_table :game_groups do |t|
 t.string :title, :null => false
 t.timestamps
end

create_table :games do |t|
  t.references :game_group, :null => false
  t.references :team1,      :null => false
  t.references :team2,      :null => false
  t.datetime   :play_at,    :null => false
  t.timestamps
end

create_table :users do |t|
end

create_table :pools do |t|
end


  end

  def down
## todo: add reversivble
  end
end
