
puts "*** loading seed data in seeds/uss/euro_bonus2.rb"

nn = User.find_by_key!( 'nn' )

euro  = Event.find_by_key!( 'euro')

poolfix  = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, nn.id, true )
poolflex = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, nn.id, false )

rfix = BonusRound.find_by_pool_id_and_pos!( poolfix.id, 2 )
qfix = BonusQuestion.find_by_round_id_and_pos!( rfix.id, 1 )

rflex = BonusRound.find_by_pool_id_and_pos!( poolflex.id, 1 )
qflex = BonusQuestion.find_by_round_id_and_pos!( rflex.id, 1 )

esp = Team.find_by_key!( 'spain' )
ita = Team.find_by_key!( 'italy' )


poolfix.plays.each do |play|
  tip = BonusTip.find_by_question_id_and_user_id!( qfix.id, play.user_id )
  
  tip.pts = 0
  tip.pts += 3   if play.team1_id == esp.id
  tip.pts += 2   if play.team2_id == ita.id
  tip.save!
end

poolflex.plays.each do |play|
  tip = BonusTip.find_by_question_id_and_user_id!( qflex.id, play.user_id )
  
  tip.pts = 0
  tip.pts += 3   if play.team1_id == esp.id
  tip.pts += 2   if play.team2_id == ita.id
  tip.save!
end

Prop.create!( key: 'db.uss.euro.bonus2.version', value: '1' )
