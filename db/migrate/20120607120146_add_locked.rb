class AddLocked < ActiveRecord::Migration

  def up
   
   add_column :pools, :locked, :boolean, :null => false, :default => false
   add_column :games, :locked, :boolean, :null => false, :default => false
   add_column :users, :active, :boolean, :null => false, :default => true
   
   Prop.create!( :key => 'db.mig.locked.version', :value => '1' )
  end

  def down
  end
end
