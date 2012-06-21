class AddBonus < ActiveRecord::Migration

  def up
    
    create_table :bonus_rounds do |t|
      t.references :pool,   :null => false
      t.string     :title,  :null => false
      t.integer    :pos,     :null => false
      t.timestamps
    end

    create_table :bonus_questions do |t|
      t.references :round,  :null => false
      t.string     :title,  :null => false
      t.integer    :pos,    :null => false
      t.timestamps
    end
    
    create_table :bonus_answers do |t|
      # to be done
      t.timestamps
    end
    
    create_table :bonus_tips do |t|
      t.references :user,     :null => false
      t.references :question, :null => false
      t.integer    :pts     , :null => false, :default => 0
      t.timestamps
    end
    
    Prop.create!( :key => 'db.mig.bonus.version', :value => '1' )
  end

  def down
  end

end
