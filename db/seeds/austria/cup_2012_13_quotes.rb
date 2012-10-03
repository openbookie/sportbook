# encoding: utf-8

##################################
### ÖFB Cup 2012/13 Quotes/Odds

cup = Event.find_by_key!( 'at_cup_2012_13' )


## bundesliga teams

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

## erste liga teams

ksv           = Team.find_by_key!( 'ksv' )
altach        = Team.find_by_key!( 'altach' )
austrial      = Team.find_by_key!( 'austrial' )
stpoelten     = Team.find_by_key!( 'stpoelten' )
linz          = Team.find_by_key!( 'linz' )
groedig       = Team.find_by_key!( 'groedig' )
lustenau      = Team.find_by_key!( 'lustenau' )
vienna        = Team.find_by_key!( 'vienna' )
hartberg      = Team.find_by_key!( 'hartberg' )
horn          = Team.find_by_key!( 'horn' )

## regionalliga west teams

hard          = Team.find_by_key!( 'hard' )
bregenz       = Team.find_by_key!( 'bregenz' )
dornbirn      = Team.find_by_key!( 'dornbirn' )
kufstein      = Team.find_by_key!( 'kufstein' )
wattens       = Team.find_by_key!( 'wattens' )
austrias      = Team.find_by_key!( 'austrias')
pinzgau       = Team.find_by_key!( 'pinzgau' )
stjohann      = Team.find_by_key!( 'stjohann' )

## regionalliga mitte teams

vsv           = Team.find_by_key!( 'vsv' )
klagenfurt    = Team.find_by_key!( 'klagenfurt' )
austriak      = Team.find_by_key!( 'austriak' )
kalsdorf      = Team.find_by_key!( 'kalsdorf' )
gratkorn      = Team.find_by_key!( 'gratkorn' )
allerheiligen = Team.find_by_key!( 'allerheiligen' )
leoben        = Team.find_by_key!( 'leoben' )
gak           = Team.find_by_key!( 'gak' )
pasching      = Team.find_by_key!( 'pasching' )
voecklamarkt  = Team.find_by_key!( 'voecklamarkt' )
stflorian     = Team.find_by_key!( 'stflorian' )
wallern       = Team.find_by_key!( 'wallern' )
lask          = Team.find_by_key!( 'lask' )

## regionalliga ost teams

sollenau      = Team.find_by_key!( 'sollenau' )
amstetten     = Team.find_by_key!( 'amstetten' )
retz          = Team.find_by_key!( 'retz' )
fac           = Team.find_by_key!( 'fac' )
schwechat     = Team.find_by_key!( 'schwechat' )
wienersk      = Team.find_by_key!( 'wienersk' )
ostbahn       = Team.find_by_key!( 'ostbahn' )
oberwart      = Team.find_by_key!( 'oberwart' )
parndorf      = Team.find_by_key!( 'parndorf' )
stegersbach   = Team.find_by_key!( 'stegersbach' )

## noch einige teams

wolfurt       = Team.find_by_key!( 'wolfurt' )
schwaz        = Team.find_by_key!( 'schwaz' )
reutte        = Team.find_by_key!( 'reutte' )
spittal       = Team.find_by_key!( 'spittal' )
sak           = Team.find_by_key!( 'sak' )
dsc           = Team.find_by_key!( 'dsc' )
micheldorf    = Team.find_by_key!( 'micheldorf' )
badvoeslau    = Team.find_by_key!( 'badvoeslau' )
gaflenz       = Team.find_by_key!( 'gaflenz' )
ardagger      = Team.find_by_key!( 'ardagger' )
rohrendorf    = Team.find_by_key!( 'rohrendorf' )
heiligenkreuz = Team.find_by_key!( 'heiligenkreuz' )
viktoria      = Team.find_by_key!( 'viktoria' )


cuprunde2 = Round.find_by_event_id_and_pos!( cup.id, 2 )


tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )


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
Prop.create!( :key => 'db.seeds.austria.cup.2012/13.quotes.version', :value => '1' )
