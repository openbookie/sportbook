class AddTables < ActiveRecord::Migration
  
  def up

change_table :games do |t|
  t.string  :toto12x      # 1,2,x,nil  calculate on save
  t.string  :key
  
end

change_table :tips do |t|
  t.string  :toto12x      # 1,2,x,nil  calculate on save
end

change_table :users do |t|
  t.string  :key
end

=begin
create_table :days do |t|    # Spieltage (1.Spieltag, 2.Spieltag, etc.)
  t.references :event,    :null => false
  t.integer    :pos,      :null => false     # 1,2,3,4, etc.
  t.date       :play_on,  :null => false     # _at for datetime, _on for date ???
  t.timestamps
end
    
create_table :groups do |t|     # Teamgruppe (zB Gruppe A, Gruppe B, etc.)
  t.references :event,    :null => false
  t.string     :title,    :null => false
  ## add pos ?? or key??  
  t.timestamps
end
    
#### todo: add posts or comments table
=end

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
