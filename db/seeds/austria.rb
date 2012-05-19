# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


puts "*** loading seed data in seeds/austria.rb"

######################################
## Oesterreichische Bundesliga 2012
##
## more info => http://bundesliga.at

bl = Event.create!( :title => 'Österr. Bundesliga 2012', :key => 'bl' )

sturm       = Team.create!( :title => 'SK Sturm Graz',       :tag => 'STU',  :key => 'sturm',       :img => 'sturm.png' )
ried        = Team.create!( :title => 'SV Ried',             :tag => 'RIED', :key => 'ried',        :img => 'ried.png' )
salzburg    = Team.create!( :title => 'FC RB Salzburg',      :tag => 'RBS',  :key => 'salzburg',    :img => 'salzburg.png' )
austria     = Team.create!( :title => 'FK Austria Wien',     :tag => 'FAK',  :key => 'austria',     :img => 'austria.png' )
rapid       = Team.create!( :title => 'SK Rapid Wien',       :tag => 'RAP',  :key => 'rapid',       :img => 'rapid.png' )
wacker      = Team.create!( :title => 'FC Wacker Innsbruck', :tag => 'IBK',  :key => 'wacker',      :img => 'wacker.png' )
neustadt    = Team.create!( :title => 'SC Wiener Neustadt',  :tag => 'WRN',  :key => 'neustadt',    :img => 'neustadt.png' )
ksv         = Team.create!( :title => 'KSV 1919',            :tag => 'KSV',  :key => 'ksv',         :img => 'ksv.png' )
mattersburg = Team.create!( :title => 'SV Mattersburg',      :tag => 'SVM',  :key => 'mattersburg', :img => 'mattersburg.png' )
admira      = Team.create!( :title => 'FC Admira',           :tag => 'ADM',  :key => 'admira',      :img => 'admira.png' )

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


bl29 = Round.create!( :event => bl, :pos => 29, :title => '29. Runde', :title2 => '7.+8. April 2012' )
bl30 = Round.create!( :event => bl, :pos => 30, :title => '30. Runde', :title2 => '14.+15. April 2012' )
bl31 = Round.create!( :event => bl, :pos => 31, :title => '31. Runde', :title2 => '21.+22. April 2012' )
bl32 = Round.create!( :event => bl, :pos => 32, :title => '32. Runde', :title2 => '28.+29. April 2012' )
bl33 = Round.create!( :event => bl, :pos => 33, :title => '33. Runde', :title2 => '5. Mai 2012' )
bl34 = Round.create!( :event => bl, :pos => 34, :title => '34. Runde', :title2 => '10. Mai 2012' )
bl35 = Round.create!( :event => bl, :pos => 35, :title => '35. Runde', :title2 => '13. Mai 2012' )
bl36 = Round.create!( :event => bl, :pos => 36, :title => '36. Runde', :title2 => '17. Mai 2012' )


games_bl29 = [
  [ 1, salzburg,    [2, 0], wacker,   '2012-04-07 16:00' ],
  [ 2, ried,        [0, 1], austria,  '2012-04-07 18:30' ],
  [ 3, ksv,         [2, 3], admira,   '2012-04-07 18:30' ],
  [ 4, rapid,       [2, 1], neustadt, '2012-04-07 18:30' ],
  [ 5, mattersburg, [0, 2], sturm,    '2012-04-08 16:00' ]
]

games_bl30 = [
  [ 1, neustadt,    [0, 0], ksv,         '2012-04-14 16:00' ],
  [ 2, admira,      [1, 1], wacker,      '2012-04-14 18:30' ],
  [ 3, sturm,       [2, 2], salzburg,    '2012-04-14 18:30' ],
  [ 4, ried,        [2, 0], mattersburg, '2012-04-14 18:30' ],
  [ 5, austria,     [0, 0], rapid,       '2012-04-15 16:00' ]
]

games_bl31 = [
  [ 1, wacker,      [2, 0], neustadt, '2012-04-21 16:00' ],
  [ 2, ksv,         [1, 0], austria,  '2012-04-21 18:30' ],
  [ 3, mattersburg, [1, 2], admira,   '2012-04-21 18:30' ],
  [ 4, salzburg,    [2, 0], ried,     '2012-04-21 18:30' ],
  [ 5, rapid,       [1, 1], sturm,    '2012-04-22 16:00' ]
]

games_bl32 = [
  [ 1, austria,     [3, 0], wacker,   '2012-04-28 16:00' ],
  [ 2, neustadt,    [1, 4], admira,   '2012-04-28 18:30' ],
  [ 3, mattersburg, [0, 1], salzburg, '2012-04-28 18:30' ],
  [ 4, sturm,       [2, 1], ksv,      '2012-04-28 18:30' ],
  [ 5, ried,        [2, 3], rapid,    '2012-04-29 16:00' ]
]

games_bl33 = [
  [ 1, neustadt,    [0, 0], sturm,       '2012-05-05 16:00' ],
  [ 2, admira,      [3, 2], austria,     '2012-05-05 18:30' ],
  [ 3, ksv,         [0, 0], ried,        '2012-05-05 18:30' ],
  [ 4, wacker,      [3, 6], mattersburg, '2012-05-05 18:30' ],
  [ 5, rapid,       [0, 1], salzburg,    '2012-05-06 16:00' ]
]

games_bl34 = [
  [ 1, salzburg,    [2, 0], ksv,          '2012-05-10 18:30' ],
  [ 2, austria,     [3, 1], neustadt,     '2012-05-10 20:30' ],
  [ 3, ried,        [1, 1], wacker,       '2012-05-10 20:30' ],
  [ 4, mattersburg, [0, 1], rapid,        '2012-05-10 20:30' ],
  [ 5, sturm,       [0, 3], admira,       '2012-05-10 20:30' ]
]

games_bl35 = [
  [ 1, ksv,       [0,2], rapid,       '2012-05-13 16:00' ],
  [ 2, wacker,    [1,1], sturm,       '2012-05-13 16:00' ],
  [ 3, neustadt,  [1,5], salzburg,    '2012-05-13 16:00' ],
  [ 4, admira,    [1,1], ried,        '2012-05-13 16:00' ],
  [ 5, austria,   [1,0], mattersburg, '2012-05-13 16:00' ]
]

games_bl36 = [
  [ 1, rapid,       [2,0], wacker,      '2012-05-17 16:00' ],
  [ 2, ried,        [2,2], neustadt,    '2012-05-17 16:00' ],
  [ 3, mattersburg, [2,0], ksv,         '2012-05-17 16:00' ],
  [ 4, sturm,       [3,1], austria,     '2012-05-17 16:00' ],
  [ 5, salzburg,    [2,0], admira,      '2012-05-17 16:00' ]
]

Game.create_from_ary!( games_bl29, bl29 )
Game.create_from_ary!( games_bl30, bl30 )
Game.create_from_ary!( games_bl31, bl31 )
Game.create_from_ary!( games_bl32, bl32 )
Game.create_from_ary!( games_bl33, bl33 )
Game.create_from_ary!( games_bl34, bl34 )
Game.create_from_ary!( games_bl35, bl35 )
Game.create_from_ary!( games_bl36, bl36 )



##################################
### ÖFB Cup 2012

ofb = Event.create!( :title => 'ÖFB Cup 2012', :key => 'ofb', :team3 => false )

hartberg =  Team.create!( :title => 'TSV Hartberg',           :key => 'hartberg', :img => 'hartberg.png' )
groedig  =  Team.create!( :title => 'SV Grödig',              :key => 'groedig',  :img => 'groedig.png' )
juniors  =  Team.create!( :title => 'FC RB Juniors Salzburg', :key => 'juniors',  :img => 'salzburg.png' )
lustenau =  Team.create!( :title => 'SC Austria Lustenau',    :key => 'lustenau', :img => 'lustenau.png' )

ofb.teams << sturm
ofb.teams << hartberg
ofb.teams << groedig
ofb.teams << ried
ofb.teams << salzburg
ofb.teams << juniors
ofb.teams << lustenau
ofb.teams << austria

ofb8    = Round.create!( :event => ofb, :pos => 1, :title => 'Viertelfinale', :title2 => '10.+11. April 2012' )
ofb4    = Round.create!( :event => ofb, :pos => 2, :title => 'Halbfinale',    :title2 => '1.+2. Mai 2012' )
ofb1    = Round.create!( :event => ofb, :pos => 3, :title => 'Finale',        :title2 => '20. Mai 2012' )

games_ofb8 = [
  [ 1, groedig,  [2, 3],       ried,     '2012-04-10 18:00' ],
  [ 2, lustenau, [1, 2],       austria,  '2012-04-11 18:00' ],
  [ 3, sturm,    [2, 2, 2, 4], hartberg, '2012-04-11 19:00' ], 
  [ 4, salzburg, [4, 1],       juniors,  '2012-04-11 19:00' ]
]

games_ofb4 = [
  [ 1, hartberg,  [0, 1], salzburg, '2012-05-01 18:00' ],
  [ 2, ried,      [2, 0], austria,  '2012-05-02 20:30' ]  
]

games_ofb1 = [
  [ 1, salzburg, [], ried, '2012-05-20 16:00' ]  
]

Game.create_knockouts_from_ary!( games_ofb8, ofb8 )
Game.create_knockouts_from_ary!( games_ofb4, ofb4 )
Game.create_knockouts_from_ary!( games_ofb1, ofb1 )