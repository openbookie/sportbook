# encoding: utf-8

####################################################
## Oesterreichische Bundesliga 2012/13 Quotes/Odds


bl = Event.find_by_key!( 'at_bl_2012_13' )


salzburg    = Team.find_by_key!( 'salzburg' )
rapid       = Team.find_by_key!( 'rapid' )
admira      = Team.find_by_key!( 'admira' )
austria     = Team.find_by_key!( 'austria' )
sturm       = Team.find_by_key!( 'sturm' )
ried        = Team.find_by_key!( 'ried' )
wacker      = Team.find_by_key!( 'wacker' )
mattersburg = Team.find_by_key!( 'mattersburg' )
neustadt    = Team.find_by_key!( 'neustadt' )
wac         = Team.find_by_key!( 'wac' )



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



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.bl.2012/13.quotes.version', :value => '1' )
