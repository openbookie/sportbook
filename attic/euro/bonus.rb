
puts "*** loading seed data in seeds/uss/euro_bonus.rb"


nn = User.find_by_key!( 'nn' )

euro  = Event.find_euro_2012!

poolfix  = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, nn.id, true )
poolflex = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, nn.id, false )

rfix1 = BonusRound.create!( pool_id: poolfix.id, pos: 1, title: 'Bonuspunkte  - Gruppenplazierung' )
rfix2 = BonusRound.create!( pool_id: poolfix.id, pos: 2, title: 'Bonuspunkte -  Europa- und Vizemeister' )

qfix1 = BonusQuestion.create!( round_id: rfix1.id, pos: 1, title: 'Gruppenerster? Gruppenzweiter? Grupperdritter? Gruppenvierter?' )
qfix2 = BonusQuestion.create!( round_id: rfix2.id, pos: 1, title: 'Europameister? Vizemeister?' )


rflex1 = BonusRound.create!( pool_id: poolflex.id, pos: 1, title: 'Bonuspunkte - Europa- und Vizemeister' )
qflex1 = BonusQuestion.create!( round_id: rflex1.id, pos: 1, title: 'Europameister? Vizemeister?' )

poolfix.players.each do |player|
  [qfix1,qfix2].each do |question|
    BonusTip.create!( question_id: question.id, user_id: player.id )
  end
end

poolflex.players.each do |player|
  [qflex1].each do |question|
    BonusTip.create!( question_id: question.id, user_id: player.id )
  end
end

Prop.create!( key: 'db.uss.euro.bonus.version', value: '1' )
