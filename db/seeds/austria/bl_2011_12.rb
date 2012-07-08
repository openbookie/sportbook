# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


puts "*** loading seed data in seeds/austria/bl_2011_12.rb"

######################################
## Oesterreichische Bundesliga 2011/12
##
## more info => http://bundesliga.at

bl = Event.create!( :key => 'at_bl_2011_12',
                    :title => 'Österr. Bundesliga 2011/12',
                    :start_at => Time.cet('2012-04-07 00:00')  )

salzburg    = Team.find_by_key!( 'salzburg' )
rapid       = Team.find_by_key!( 'rapid' )
admira      = Team.find_by_key!( 'admira' )
austria     = Team.find_by_key!( 'austria' )
sturm       = Team.find_by_key!( 'sturm' )
ried        = Team.find_by_key!( 'ried' )
wacker      = Team.find_by_key!( 'wacker' )
mattersburg = Team.find_by_key!( 'mattersburg' )
neustadt    = Team.find_by_key!( 'neustadt' )
ksv         = Team.find_by_key!( 'ksv' )

bl.teams << salzburg
bl.teams << rapid
bl.teams << admira
bl.teams << austria
bl.teams << sturm
bl.teams << ried
bl.teams << wacker
bl.teams << mattersburg
bl.teams << neustadt
bl.teams << ksv


bl29 = Round.create!( :event => bl, :pos => 29, :title => '29. Runde', :title2 => '7.+8. April 2012' )
bl30 = Round.create!( :event => bl, :pos => 30, :title => '30. Runde', :title2 => '14.+15. April 2012' )
bl31 = Round.create!( :event => bl, :pos => 31, :title => '31. Runde', :title2 => '21.+22. April 2012' )
bl32 = Round.create!( :event => bl, :pos => 32, :title => '32. Runde', :title2 => '28.+29. April 2012' )
bl33 = Round.create!( :event => bl, :pos => 33, :title => '33. Runde', :title2 => '5. Mai 2012' )
bl34 = Round.create!( :event => bl, :pos => 34, :title => '34. Runde', :title2 => '10. Mai 2012' )
bl35 = Round.create!( :event => bl, :pos => 35, :title => '35. Runde', :title2 => '13. Mai 2012' )
bl36 = Round.create!( :event => bl, :pos => 36, :title => '36. Runde', :title2 => '17. Mai 2012' )


games_bl29 = [
  [ 1, salzburg,    [2, 0], wacker,   Time.cet('2012-04-07 16:00') ],
  [ 2, ried,        [0, 1], austria,  Time.cet('2012-04-07 18:30') ],
  [ 3, ksv,         [2, 3], admira,   Time.cet('2012-04-07 18:30') ],
  [ 4, rapid,       [2, 1], neustadt, Time.cet('2012-04-07 18:30') ],
  [ 5, mattersburg, [0, 2], sturm,    Time.cet('2012-04-08 16:00') ]
]

games_bl30 = [
  [ 1, neustadt,    [0, 0], ksv,         Time.cet('2012-04-14 16:00') ],
  [ 2, admira,      [1, 1], wacker,      Time.cet('2012-04-14 18:30') ],
  [ 3, sturm,       [2, 2], salzburg,    Time.cet('2012-04-14 18:30') ],
  [ 4, ried,        [2, 0], mattersburg, Time.cet('2012-04-14 18:30') ],
  [ 5, austria,     [0, 0], rapid,       Time.cet('2012-04-15 16:00') ]
]

games_bl31 = [
  [ 1, wacker,      [2, 0], neustadt, Time.cet('2012-04-21 16:00') ],
  [ 2, ksv,         [1, 0], austria,  Time.cet('2012-04-21 18:30') ],
  [ 3, mattersburg, [1, 2], admira,   Time.cet('2012-04-21 18:30') ],
  [ 4, salzburg,    [2, 0], ried,     Time.cet('2012-04-21 18:30') ],
  [ 5, rapid,       [1, 1], sturm,    Time.cet('2012-04-22 16:00') ]
]

games_bl32 = [
  [ 1, austria,     [3, 0], wacker,   Time.cet('2012-04-28 16:00') ],
  [ 2, neustadt,    [1, 4], admira,   Time.cet('2012-04-28 18:30') ],
  [ 3, mattersburg, [0, 1], salzburg, Time.cet('2012-04-28 18:30') ],
  [ 4, sturm,       [2, 1], ksv,      Time.cet('2012-04-28 18:30') ],
  [ 5, ried,        [2, 3], rapid,    Time.cet('2012-04-29 16:00') ]
]

games_bl33 = [
  [ 1, neustadt,    [0, 0], sturm,       Time.cet('2012-05-05 16:00') ],
  [ 2, admira,      [3, 2], austria,     Time.cet('2012-05-05 18:30') ],
  [ 3, ksv,         [0, 0], ried,        Time.cet('2012-05-05 18:30') ],
  [ 4, wacker,      [3, 6], mattersburg, Time.cet('2012-05-05 18:30') ],
  [ 5, rapid,       [0, 1], salzburg,    Time.cet('2012-05-06 16:00') ]
]

games_bl34 = [
  [ 1, salzburg,    [2, 0], ksv,          Time.cet('2012-05-10 18:30') ],
  [ 2, austria,     [3, 1], neustadt,     Time.cet('2012-05-10 20:30') ],
  [ 3, ried,        [1, 1], wacker,       Time.cet('2012-05-10 20:30') ],
  [ 4, mattersburg, [0, 1], rapid,        Time.cet('2012-05-10 20:30') ],
  [ 5, sturm,       [0, 3], admira,       Time.cet('2012-05-10 20:30') ]
]

games_bl35 = [
  [ 1, ksv,       [0,2], rapid,       Time.cet('2012-05-13 16:00') ],
  [ 2, wacker,    [1,1], sturm,       Time.cet('2012-05-13 16:00') ],
  [ 3, neustadt,  [1,5], salzburg,    Time.cet('2012-05-13 16:00') ],
  [ 4, admira,    [1,1], ried,        Time.cet('2012-05-13 16:00') ],
  [ 5, austria,   [1,0], mattersburg, Time.cet('2012-05-13 16:00') ]
]

games_bl36 = [
  [ 1, rapid,       [2,0], wacker,      Time.cet('2012-05-17 16:00') ],
  [ 2, ried,        [2,2], neustadt,    Time.cet('2012-05-17 16:00') ],
  [ 3, mattersburg, [2,0], ksv,         Time.cet('2012-05-17 16:00') ],
  [ 4, sturm,       [3,1], austria,     Time.cet('2012-05-17 16:00') ],
  [ 5, salzburg,    [2,0], admira,      Time.cet('2012-05-17 16:00') ]
]

Game.create_from_ary!( games_bl29, bl29 )
Game.create_from_ary!( games_bl30, bl30 )
Game.create_from_ary!( games_bl31, bl31 )
Game.create_from_ary!( games_bl32, bl32 )
Game.create_from_ary!( games_bl33, bl33 )
Game.create_from_ary!( games_bl34, bl34 )
Game.create_from_ary!( games_bl35, bl35 )
Game.create_from_ary!( games_bl36, bl36 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.bl.2011/12.version', :value => '1' )

