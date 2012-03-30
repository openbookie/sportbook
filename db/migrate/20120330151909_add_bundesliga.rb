# encoding: utf-8

class AddBundesliga < ActiveRecord::Migration

  def up

bl = Event.create!( :title => 'Österreichische Bundesliga 2012', :key => 'bl' )

## already setup in ofb cup 2012
#
# sturm    =  Team.create!( :title => 'SK Sturm Graz',          :key => 'sturm',    :img => 'cup-sturm2.png' )
# ried     =  Team.create!( :title => 'SV Ried',                :key => 'ried',     :img => 'cup-ried2.png' )
# salzburg =  Team.create!( :title => 'FC RB Salzburg',         :key => 'salzburg', :img => 'cup-salzburg2.png' )
# austria  =  Team.create!( :title => 'FK Austria Wien',        :key => 'austria',  :img => 'cup-austria2.png' )

sturm    = Team.find_by_key!( 'sturm' )
salzburg = Team.find_by_key!( 'salzburg' )
austria  = Team.find_by_key!( 'austria' )
ried     = Team.find_by_key!( 'ried' )


rapid       = Team.create!( :title => 'SK Rapid Wien',       :key => 'rapid',       :img => 'rapid.png' )
wacker      = Team.create!( :title => 'FC Wacker Innsbruck', :key => 'wacker',      :img => 'wacker.png' )
neustadt    = Team.create!( :title => 'SC Wiener Neustadt',  :key => 'neustadt',    :img => 'neustadt.png' )
ksv         = Team.create!( :title => 'KSV 1919',            :key => 'ksv',         :img => 'ksv.png' )
mattersburg = Team.create!( :title => 'SV Mattersburg',      :key => 'mattersburg', :img => 'mattersburg.png' )
admira      = Team.create!( :title => 'FC Admira',           :key => 'admira',      :img => 'admira.png' )


bl.teams << sturm
bl.teams << salzburg
bl.teams << austria
bl.teams << ried
bl.teams << rapid
bl.teams << wacker
bl.teams << neustadt
bl.teams << ksv
bl.teams << mattersburg
bl.teams << admira


bl29 = Round.create!( :event => bl, :pos => 29, :title => '29. Runde : 7.+8. April 2012' )
bl30 = Round.create!( :event => bl, :pos => 30, :title => '30. Runde : 14.+15. April 2012' )
bl31 = Round.create!( :event => bl, :pos => 31, :title => '31. Runde : 21.+22. April 2012' )
bl32 = Round.create!( :event => bl, :pos => 32, :title => '32. Runde : 28.+29. April 2012' )
bl33 = Round.create!( :event => bl, :pos => 33, :title => '33. Runde : 5. Mai 2012' )
bl34 = Round.create!( :event => bl, :pos => 34, :title => '34. Runde : 10. Mai 2012' )
bl35 = Round.create!( :event => bl, :pos => 35, :title => '35. Runde : 13. Mai 2012' )
bl36 = Round.create!( :event => bl, :pos => 36, :title => '36. Runde : 17. Mai 2012' )

games_bl29 = [
  [ 1, salzburg,    nil, nil, wacker,   '2012-04-07 16:00' ],
  [ 2, ried,        nil, nil, austria,  '2012-04-07 18:30' ],
  [ 3, ksv,         nil, nil, admira,   '2012-04-07 18:30' ],
  [ 4, rapid,       nil, nil, neustadt, '2012-04-07 18:30' ],
  [ 5, mattersburg, nil, nil, sturm,    '2012-04-08 16:00' ]
]

games_bl30 = [
  [ 1, neustadt,   nil, nil, ksv,         '2012-04-14 16:00' ],
  [ 2, admira,     nil, nil, wacker,      '2012-04-14 18:30' ],
  [ 3, sturm,      nil, nil, salzburg,    '2012-04-14 18:30' ],
  [ 4, ried,       nil, nil, mattersburg, '2012-04-14 18:30' ],
  [ 5, austria,    nil, nil, rapid,       '2012-04-15 16:00' ]
]

games_bl31 = [
  [ 1, wacker,      nil, nil, neustadt,   '2012-04-21 16:00' ],
  [ 2, ksv,         nil, nil, austria,  '2012-04-21 18:30' ],
  [ 3, mattersburg, nil, nil, admira,   '2012-04-21 18:30' ],
  [ 4, salzburg,    nil, nil, ried,     '2012-04-21 18:30' ],
  [ 5, rapid,       nil, nil, sturm,    '2012-04-22 16:00' ]
]

games_bl32 = [
  [ 1, austria,     nil, nil, wacker,   '2012-04-28 16:00' ],
  [ 2, neustadt,    nil, nil, admira,   '2012-04-28 18:30' ],
  [ 3, mattersburg, nil, nil, salzburg, '2012-04-28 18:30' ],
  [ 4, sturm,       nil, nil, ksv,      '2012-04-28 18:30' ],
  [ 5, ried,        nil, nil, rapid,    '2012-04-29 16:00' ]
]

games_bl33 = [
  [ 1, admira,    nil, nil, austria,     '2012-05-05 16:00' ],
  [ 2, rapid,     nil, nil, salzburg,    '2012-05-05 16:00' ],
  [ 3, ksv,       nil, nil, ried,        '2012-05-05 16:00' ],
  [ 4, neustadt,  nil, nil, sturm,       '2012-05-05 16:00' ],
  [ 5, wacker,    nil, nil, mattersburg, '2012-05-05 16:00' ]
]

games_bl34 = [
  [ 1, austria,     nil, nil, neustadt,     '2012-05-10 16:00' ],
  [ 2, ried,        nil, nil, wacker,       '2012-05-10 16:00' ],
  [ 3, salzburg,    nil, nil, ksv,          '2012-05-10 16:00' ],
  [ 4, mattersburg, nil, nil, rapid,        '2012-05-10 16:00' ],
  [ 5, sturm,       nil, nil, admira,       '2012-05-10 16:00' ]
]

games_bl35 = [
  [ 1, ksv,       nil, nil, rapid,       '2012-05-13 16:00' ],
  [ 2, wacker,    nil, nil, sturm,       '2012-05-13 16:00' ],
  [ 3, neustadt,  nil, nil, salzburg,    '2012-05-13 16:00' ],
  [ 4, admira,    nil, nil, ried,        '2012-05-13 16:00' ],
  [ 5, austria,   nil, nil, mattersburg, '2012-05-13 16:00' ]
]

games_bl36 = [
  [ 1, rapid,       nil, nil, wacker,      '2012-05-17 16:00' ],
  [ 2, ried,        nil, nil, neustadt,    '2012-05-17 16:00' ],
  [ 3, mattersburg, nil, nil, ksv,         '2012-05-17 16:00' ],
  [ 4, sturm,       nil, nil, austria,     '2012-05-17 16:00' ],
  [ 5, salzburg,    nil, nil, admira,      '2012-05-17 16:00' ]
]

Game.create_from_ary!( games_bl29, bl29 )
Game.create_from_ary!( games_bl30, bl30 )
Game.create_from_ary!( games_bl31, bl31 )
Game.create_from_ary!( games_bl32, bl32 )
Game.create_from_ary!( games_bl33, bl33 )
Game.create_from_ary!( games_bl34, bl34 )
Game.create_from_ary!( games_bl35, bl35 )
Game.create_from_ary!( games_bl36, bl36 )

manfred  =  User.find_by_email!( 'manfred' )

pool = Pool.create!( :event => bl, :title => 'UNIQA USS EF Test', :user => manfred, :welcome => '' )
pool.players << manfred  # also add amin first

  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end