class AddKeys < ActiveRecord::Migration
  
  def up
    ### todo: remove/delete migration (folded into create_db)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end