class AddBonus2 < ActiveRecord::Migration

  def up
    
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

    Prop.create!( :key => 'db.mig.bonus2.version', :value => '1' )
  end

  def down
  end
end
