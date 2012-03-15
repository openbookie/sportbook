class AddMoreColumns < ActiveRecord::Migration

  def up
    change_table :games do |t|
      ## todo: add references :game_next, :game_prev (for hinspiel bei rueckspiel in knockout game)
    end

    change_table :events do |t|
      ## todo: add references :game_next, :game_prev (for hinspiel bei rueckspiel in knockout game)
      t.boolean :team3, :default => true  ## fix/todo: add :null => false
      ## e.g. Champions League has no 3rd place (only 1st and 2nd/final)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
