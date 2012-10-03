# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


puts "*** loading seed data in seeds/austria/cup_2011_12.rb"

##################################
### ÖFB Cup 2011/12

ofb = Event.create!( :key => 'at_cup_2011_12', :title => 'ÖFB Cup 2011/12', :team3 => false, :start_at => Time.cet( '2011-10-10 17:00' ) )


sturm       = Team.find_by_key!( 'sturm' )
ried        = Team.find_by_key!( 'ried' )
salzburg    = Team.find_by_key!( 'salzburg' )
austria     = Team.find_by_key!( 'austria' )
rapid       = Team.find_by_key!( 'rapid' )
wacker      = Team.find_by_key!( 'wacker' )
neustadt    = Team.find_by_key!( 'neustadt')
ksv         = Team.find_by_key!( 'ksv' )
mattersburg = Team.find_by_key!( 'mattersburg' )
admira      = Team.find_by_key!( 'admira' )


hartberg    = Team.find_by_key!( 'hartberg' )
groedig     = Team.find_by_key!( 'groedig' )
juniors     = Team.find_by_key!( 'juniors' )
austrial    = Team.find_by_key!( 'austrial' )

ofb.teams << sturm
ofb.teams << hartberg
ofb.teams << groedig
ofb.teams << ried
ofb.teams << salzburg
ofb.teams << juniors
ofb.teams << austrial
ofb.teams << austria

ofb8    = Round.create!( :event => ofb, :pos => 1, :title => 'Viertelfinale', :title2 => '10.+11. April 2012' )
ofb4    = Round.create!( :event => ofb, :pos => 2, :title => 'Halbfinale',    :title2 => '1.+2. Mai 2012' )
ofb1    = Round.create!( :event => ofb, :pos => 3, :title => 'Finale',        :title2 => '20. Mai 2012' )

games_ofb8 = [
  [ 1, groedig,   [2, 3],       ried,     Time.cet('2012-04-10 18:00') ],
  [ 2, austrial,  [1, 2],       austria,  Time.cet('2012-04-11 18:00') ],
  [ 3, sturm,     [2, 2, 2, 4], hartberg, Time.cet('2012-04-11 19:00') ], 
  [ 4, salzburg,  [4, 1],       juniors,  Time.cet('2012-04-11 19:00') ]
]

games_ofb4 = [
  [ 1, hartberg,  [0, 1], salzburg, Time.cet('2012-05-01 18:00') ],
  [ 2, ried,      [2, 0], austria,  Time.cet('2012-05-02 20:30') ]
]

games_ofb1 = [
  [ 1, salzburg, [3,0], ried, Time.cet('2012-05-20 16:00') ]
]

Game.create_knockouts_from_ary!( games_ofb8, ofb8 )
Game.create_knockouts_from_ary!( games_ofb4, ofb4 )
Game.create_knockouts_from_ary!( games_ofb1, ofb1 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.cup.2011/12.version', :value => '1' )
