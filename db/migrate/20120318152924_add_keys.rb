class AddKeys < ActiveRecord::Migration
  
  def up
    
    change_table :teams do |t|
      t.string :key        # fix: make it :null => false
    end
    
    change_table :events do |t|
      t.string :key        # fix: make it :null => false
    end
    
    change_table :pools do |t|
      t.string :key        #  if nil use id plus key from event e.g "#{event.key}#{id} e.g. euro1"
    end
    
    ## todo: game_group
    # add "virtual" key field (read-only)
    # -- use pos plus key from event e.g. "#{event.key}#{pos} e.g. euro1"
    
    ## todo: user
    ## add "virtual" key field (read-only)
    #  -- for now use email (shortend??)
    
    
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end