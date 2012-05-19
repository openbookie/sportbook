# encoding: utf-8

puts "*** loading seed data in seeds/uss/tips_euro.rb"


gerald  = User.find_by_email!( 'gerald' )
guersel = User.find_by_email!( 'gürsel' )
behrooz = User.find_by_email!( 'behrooz' )

euro  = Event.find_by_key!( 'euro')

pool1 = Pool.find_by_event_id_and_user_id_and_fix!( euro.id, behrooz.id, true )

pool1.players << gerald
pool1.players << guersel


euroa = Group.find_by_event_id_and_pos!( euro.id, 1 )

g1  = Game.find_by_group_id_and_pos!( euroa.id, 1 )
g2  = Game.find_by_group_id_and_pos!( euroa.id, 2 )
g9  = Game.find_by_group_id_and_pos!( euroa.id, 9 )
g10 = Game.find_by_group_id_and_pos!( euroa.id, 10 )

g1.update_attributes!( :score1 => 1, :score2 => 2 )
g2.update_attributes!( :score1 => 0, :score2 => 0 )
g9.update_attributes!( :score1 => 2, :score2 => 3 )
g10.update_attributes!( :score1 => 2, :score2 => 1 )

Tip.create!( :user => gerald, :pool => pool1, :game => g1,   :score1 => 2, :score2 => 4 )   # bingo
Tip.create!( :user => gerald, :pool => pool1, :game => g2,   :score1 => 1, :score2 => 1 )   # bingoo
Tip.create!( :user => gerald, :pool => pool1, :game => g9,   :score1 => 2, :score2 => 3 )   # bingooo
Tip.create!( :user => gerald, :pool => pool1, :game => g10,  :score1 => 0, :score2 => 2 )

Tip.create!( :user => guersel, :pool => pool1, :game => g1, :score1 => 2, :score2 => 3 )
Tip.create!( :user => guersel, :pool => pool1, :game => g2, :score1 => 1, :score2 => 4 ) 
