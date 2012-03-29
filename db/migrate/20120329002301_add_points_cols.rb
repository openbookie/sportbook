class AddPointsCols < ActiveRecord::Migration

  def up
    
    change_table :points do |t|
      t.integer :diff_total_pos, :null => false, :default => 0
      t.integer :diff_total_pts, :null => false, :default => 0  ## todo/fix: remove same as round_pts!!
    end

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
