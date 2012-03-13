class AddColumns < ActiveRecord::Migration
  
  def up
    change_table :game_groups do |t|
      t.boolean :calc,  :default => false   # , :null => false   --todo/fix: make not nullable
    end
    
    change_table :games do |t|
      t.boolean :knockout, :default => false  # , :null => false   --todo/fix: make not nullable
      t.integer :score3    # verlaengerung (opt)
      t.integer :score4
      t.integer :score5    # elfmeter (opt)
      t.integer :score6
      
      ## todo: add references :game_next, :game_prev (for hinspiel bei rueckspiel in knockout game)
    end
    
    change_table :events do |t|
      t.datetime :start_at  # , :null => false   --todo/fix: make not nullable
    end

    change_table :pools do |t|
      t.boolean :fix,  :default => false  # , :null => false   --todo/fix: make not nullable
    end

    change_table :tips do |t|
      t.integer :score3    # verlaengerung (opt)
      t.integer :score4
      t.integer :score5    # elfmeter (opt)
      t.integer :score6
    end

    change_table :pools_users do |t|
      t.references :team1   # winner (1st)
      t.references :team2   # runnerup (2nd)
      t.references :team3   # 2n runnerup (3nd)
      t.integer :points      # cache players points
    end

    create_table :events_teams do |t|
      t.references :event, :null => false
      t.references :team, :null => false
      t.timestamps
    end

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end 