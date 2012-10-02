# encoding: utf-8

##################################
### ÖFB Cup 2012/13 Part II

puts "*** loading seed data in seeds/austria/cup_2012_13_2.rb"


lask          = Team.find_by_key!( 'lask' )
mattersburg   = Team.find_by_key!( 'mattersburg' )
rapid         = Team.find_by_key!( 'rapid' )
altach        = Team.find_by_key!( 'altach' )
viktoria      = Team.find_by_key!( 'viktoria' )
ried          = Team.find_by_key!( 'ried' )
sturm         = Team.find_by_key!( 'sturm' )
wacker        = Team.find_by_key!( 'wacker' )
pasching      = Team.find_by_key!( 'pasching' )
austriak      = Team.find_by_key!( 'austriak' )
lustenau      = Team.find_by_key!( 'lustenau' )
wac           = Team.find_by_key!( 'wac' )
kalsdorf      = Team.find_by_key!( 'kalsdorf' )
salzburg      = Team.find_by_key!( 'salzburg' )
vsv           = Team.find_by_key!( 'vsv' )
austria       = Team.find_by_key!( 'austria' )

# bl clubs
admira      = Team.find_by_key!( 'admira' )
neustadt    = Team.find_by_key!( 'neustadt' )

# more clubs

austrial      = Team.find_by_key!( 'austrial' )
ksv           = Team.find_by_key!( 'ksv' )
groedig       = Team.find_by_key!( 'groedig' )


cup = Event.find_by_key!( 'at_cup_2012_13' )

bl = Event.find_by_key!( 'at_bl_2012_13' )


tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )


tipp3_winner_odds = [
  [ salzburg,    1.55 ],
  [ rapid,       4    ],
  [ austria,     4    ],
  [ sturm,       15   ],
  [ admira,      30   ],
  [ ried,        75   ],
  [ mattersburg, 150  ],
  [ wac,         200  ],
  [ neustadt,    700  ],
  [ wacker,      850  ]]

betathome_winner_odds = [
  [ salzburg,    1.65 ],
  [ rapid,       3.9  ],
  [ austria,     3.9  ],
  [ sturm,       17   ],
  [ ried,        50   ],
  [ wac,         70   ],
  [ admira,      75   ],
  [ mattersburg, 100  ],
  [ neustadt,    250  ],
  [ wacker,      350  ]]


EventQuote.create_from_ary!( tipp3_winner_odds, tipp3, bl )
EventQuote.create_from_ary!( betathome_winner_odds, betathome, bl )

bl11 = Round.find_by_event_id_and_pos!( bl.id, 11 )

games_bl11_tipp3_odds = [
  [ wac,         ried,      2.2, 3,   2.6   ],
  [ rapid,       neustadt,  1.2, 4.7, 8.6   ],
  [ mattersburg, salzburg,  3.7, 3.1, 1.75  ],
  [ sturm,       austria,   2.4, 2.9, 2.5   ],
  [ admira,      wacker,    1.4, 3.7, 5.7   ]
]

games_bl11_betathome_odds = [
  [ wac,         ried,      2.4,  3.25, 2.7  ],
  [ rapid,       neustadt,  1.25, 5.5,  9    ],
  [ mattersburg, salzburg,  3.95, 3.35, 1.85 ],
  [ sturm,       austria,   2.5,  3.1,  2.7  ],
  [ admira,      wacker,    1.45, 4.3,  5.9  ]
]

Quote.create_from_ary_for_round!( games_bl11_tipp3_odds, tipp3, bl11 )
Quote.create_from_ary_for_round!( games_bl11_betathome_odds, betathome, bl11 )



tipp3_cup_winner_odds = [
  [ salzburg,    3  ],
  [ rapid,       4  ],
  [ austria,     4  ],
  [ sturm,       8  ],
  [ admira,      10 ],
  [ ried,        12 ],
  [ wac,         20 ],
  [ mattersburg, 20 ],
  [ neustadt,    25 ],
  [ wacker,      25 ],
  [ austrial,    25 ],
  [ altach,      30 ],
  [ groedig,     30 ],
  [ ksv,         40 ],
  [ lustenau,    50 ]]

EventQuote.create_from_ary!( tipp3_cup_winner_odds, tipp3, cup )


cup16 = Round.find_by_event_id_and_pos!( cup.id, 3 )

games_cup16 = [
  [ 1, lask,     [], mattersburg, Time.cet('2012-10-30 00:00') ],
  [ 2, rapid,    [], altach,      Time.cet('2012-10-30 00:00') ],
  [ 3, viktoria, [], ried,        Time.cet('2012-10-30 00:00') ],
  [ 4, sturm,    [], wacker,      Time.cet('2012-10-30 00:00') ],
  [ 5, pasching, [], austriak,    Time.cet('2012-10-30 00:00') ],
  [ 6, lustenau, [], wac,         Time.cet('2012-10-30 00:00') ],
  [ 7, kalsdorf, [], salzburg,    Time.cet('2012-10-30 00:00') ],
  [ 8, vsv,      [], austria,     Time.cet('2012-10-30 00:00') ]]

Game.create_knockouts_from_ary!( games_cup16, cup16 )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.cup.2012/13.2.version', :value => '1' )
