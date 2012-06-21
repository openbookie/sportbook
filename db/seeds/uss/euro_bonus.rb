
puts "*** loading seed data in seeds/uss/euro_bonus.rb"


behrooz = User.find_by_key!( 'behroozs' )

euro  = Event.find_by_key!( 'euro')

poolfix  = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, behrooz.id, true )
poolflex = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, behrooz.id, false )

rfix1 = BonusRound.create!( :pool_id => poolfix.id, :pos => 1, :title => 'Bonuspunkte -  Europa- und Vizemeister' )
rfix2 = BonusRound.create!( :pool_id => poolfix.id, :pos => 2, :title => 'Bonuspunkte  - Gruppenplazierung' )

qfix1 = BonusQuestion.create!( :round_id => rfix1.id, :pos => 1, :title => 'Europameister? Vizemeister?' )
qfix2 = BonusQuestion.create!( :round_id => rfix2.id, :pos => 1, :title => 'Gruppenerster? Gruppenzweiter? Grupperdritter? Gruppenvierter?' )


rflex1 = BonusRound.create!( :pool_id => poolflex.id, :pos => 1, :title => 'Bonuspunkte - Europa- und Vizemeister' )
qflex1 = BonusQuestion.create!( :round_id => rflex1.id, :pos => 1, :title => 'Europameister? Vizemeister?' )

poolfix.players.each do |player|
  [qfix1,qfix2].each do |question|
    BonusTip.create!( :question_id => question.id, :user_id => player.id )
  end
end

poolflex.players.each do |player|
  [qflex1].each do |question|
    BonusTip.create!( :question_id => question.id, :user_id => player.id )
  end
end

Prop.create!( :key => 'db.seeds.uss.euro.bonus.version', :value => '1' )
