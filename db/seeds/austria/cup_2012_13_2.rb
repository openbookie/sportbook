# encoding: utf-8

##################################
### ÖFB Cup 2012/13 Part II


kalsdorf      = Team.find_by_key!( 'kalsdorf' )
hartberg      = Team.find_by_key!( 'hartberg' )
viktoria      = Team.find_by_key!( 'viktoria' )
ksv           = Team.find_by_key!( 'ksv' )
hard          = Team.find_by_key!( 'hard' )
altach        = Team.find_by_key!( 'altach' )
stegersbach   = Team.find_by_key!( 'stegersbach' )
salzburg      = Team.find_by_key!( 'salzburg' )
pasching      = Team.find_by_key!( 'pasching' )
austrial      = Team.find_by_key!( 'austrial' )
austriak      = Team.find_by_key!( 'austriak' )
admira        = Team.find_by_key!( 'admira' )
schwechat     = Team.find_by_key!( 'schwechat' )
sturm         = Team.find_by_key!( 'sturm' )
lask          = Team.find_by_key!( 'lask' )
groedig       = Team.find_by_key!( 'groedig' )
stjohann      = Team.find_by_key!( 'stjohann' )
lustenau      = Team.find_by_key!( 'lustenau' )
sollenau      = Team.find_by_key!( 'sollenau' )
wacker        = Team.find_by_key!( 'wacker' )
vsv           = Team.find_by_key!( 'vsv' )
neustadt      = Team.find_by_key!( 'neustadt' )
dornbirn      = Team.find_by_key!( 'dornbirn' )
austria       = Team.find_by_key!( 'austria' )
badvoeslau    = Team.find_by_key!( 'badvoeslau' )
mattersburg   = Team.find_by_key!( 'mattersburg' )
stflorian     = Team.find_by_key!( 'stflorian' )
ried          = Team.find_by_key!( 'ried' )
allerheiligen = Team.find_by_key!( 'allerheiligen' )
rapid         = Team.find_by_key!( 'rapid' )
gak           = Team.find_by_key!( 'gak' )
wac           = Team.find_by_key!( 'wac' )


cup = Event.find_by_key!( 'at_cup_2012_13' )

cuprunde2  = Round.find_by_event_id_and_pos( cup.id, 2 )

tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )

cuprunde2_tipp3_odds = [
  [ kalsdorf,      hartberg,    2.7, 2.9, 2.1  ],
  [ viktoria,      ksv,         6.8, 4.5, 1.2  ],
  [ hard,          altach,      6.8, 4.5, 1.2  ],
  [ stegersbach,   salzburg,    12,  6,   1.05 ],
  [ pasching,      austrial,    3.8, 3.4, 1.55 ],
  [ austriak,      admira,      6.8, 4.5, 1.2  ],
  [ schwechat,     sturm,       9,   5.5, 1.1  ],
  [ lask,          groedig,     3.1, 3,   1.85 ],
  [ stjohann,      lustenau,    4.6, 3.4, 1.45 ],
  [ sollenau,      wacker,      6.5, 4,   1.25 ],
  [ vsv,           neustadt,    5.8, 3.8, 1.3  ],
  [ dornbirn,      austria,     9,   5.5, 1.1  ],
  [ badvoeslau,    mattersburg, 7.5, 5,   1.15 ],
  [ stflorian,     ried,        6.8, 4.5, 1.2  ],
  [ allerheiligen, rapid,       12,  6,   1.05 ],
  [ gak,           wac,         5.8, 3.8, 1.3  ]
]

cuprunde2_betathome_odds = [
  [ kalsdorf,      hartberg,    3.1,  3.2,  2.05 ],
  [ viktoria,      ksv,         7.5,  5.2,  1.25 ],
  [ hard,          altach,      8.5,  5.8,  1.2  ],
  [ stegersbach,   salzburg,    13,   11,   1.05 ],
  [ pasching,      austrial,    4.3,  3.75, 1.6  ],
  [ austriak,      admira,      7,    5.5,  1.25 ],
  [ schwechat,     sturm,       13,   7.2,  1.1  ],
  [ lask,          groedig,     3.6,  3.3,  1.85 ],
  [ stjohann,      lustenau,    4.75, 3.75, 1.55 ],
  [ sollenau,      wacker,      9,    5.5,  1.2  ],
  [ vsv,           neustadt,    6.5,  5,    1.3  ],
  [ dornbirn,      austria,     13,   7.2,  1.1  ],
  [ badvoeslau,    mattersburg, 13,   7.2,  1.1  ],
  [ stflorian,     ried,        11,   6.2,  1.15 ],
  [ allerheiligen, rapid,       13,   11,   1.05 ],
  [ gak,           wac,         7.2,  4.5,  1.3  ]
]

Quote.create_from_ary_for_round!( cuprunde2_tipp3_odds, tipp3, cuprunde2 )
Quote.create_from_ary_for_round!( cuprunde2_betathome_odds, betathome, cuprunde2 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.cup.2012/13.2.version', :value => '1' )
