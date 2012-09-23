# encoding: utf-8

puts "*** loading seed data in seeds/cl/cl_2012_13_2.rb"

porto         = Team.find_by_key!( 'porto' )
kiew          = Team.find_by_key!( 'kiew' )
paris         = Team.find_by_key!( 'paris' )
zagreb        = Team.find_by_key!( 'zagreb' )

arsenal       = Team.find_by_key!( 'arsenal' )
schalke       = Team.find_by_key!( 'schalke' )
olympiacos    = Team.find_by_key!( 'olympiacos' )
montpellier   = Team.find_by_key!( 'montpellier' )

milan         = Team.find_by_key!( 'milan' )
zenit         = Team.find_by_key!( 'zenit' )
anderlecht    = Team.find_by_key!( 'anderlecht' )
malaga        = Team.find_by_key!( 'malaga' )

madrid        = Team.find_by_key!( 'madrid' )
mancity       = Team.find_by_key!( 'mancity' )
ajax          = Team.find_by_key!( 'ajax' )
dortmund      = Team.find_by_key!( 'dortmund' )

chelsea       = Team.find_by_key!( 'chelsea' )
donezk        = Team.find_by_key!( 'donezk' )
juventus      = Team.find_by_key!( 'juventus' )
nordsjalland  = Team.find_by_key!( 'nordsjalland' )

bayern        = Team.find_by_key!( 'bayern' )
valencia      = Team.find_by_key!( 'valencia' )
lille         = Team.find_by_key!( 'lille' )
borissow      = Team.find_by_key!( 'borissow' )

barcelona     = Team.find_by_key!( 'barcelona' )
benfica       = Team.find_by_key!( 'benfica' )
spartak       = Team.find_by_key!( 'spartak' )
celtic        = Team.find_by_key!( 'celtic' )

manunited     = Team.find_by_key!( 'manunited' )
braga         = Team.find_by_key!( 'braga' )
galatasaray   = Team.find_by_key!( 'galatasaray' )
cluj          = Team.find_by_key!( 'cluj' )


cl = Event.find_by_key!( 'cl.2012/13' )
clr1   = Round.find_by_event_id_and_pos!( cl.id, 1 )
clr2   = Round.find_by_event_id_and_pos!( cl.id, 2 )

tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )

=begin
betathome_winner_odds = [
 [ barcelona,   3.4 ],
 [ madrid,      4.2 ],
 [ bayern,      8 ],
 [ manunited,   10 ],
 [ mancity,     12 ],
 [ chelsea,     15 ],
 [ paris,       15 ],
 [ juventus,    15 ],
 [ arsenal,     18 ],
 [ dortmund,    20 ],
 [ milan,       50 ],
 [ porto,       80 ],
 [ schalke,     80 ],
 [ zenit,       80 ],
 [ valencia,    100 ],
 [ malaga,      100 ],
 [ donezk,      150 ],
 [ galatasaray, 150 ],
 [ benfica,     200 ],
 [ kiew,        500 ],
 [ celtic,      500 ],
 [ spartak,     500 ],
 [ montpellier, 500 ],
 [ olympiacos,  500 ],
 [ anderlecht,  750 ],
 [ cluj,        750 ],
 [ braga,       750 ],
 [ lille,       750 ],
 [ borissow,     750 ],
 [ ajax,         750 ],
 [ zagreb,       1000 ],
 [ nordsjalland, 1000 ]]

EventQuote.create_from_ary!( betathome_winner_odds, betathome, cl )
=end

clr1_tipp3_odds = [
 [ paris,       kiew,         1.55, 3.3, 4.5  ],
 [ zagreb,      porto,        3.2,  3,   1.8  ],
 [ milan,       anderlecht,   1.4,  3.5, 6    ],
 [ malaga,      zenit,        2.3,  3,   2.3  ],
 [ olympiacos,  schalke,      2.4,  3,   2.4  ],
 [ montpellier, arsenal,      2.7,  3.1, 2.1  ],
 [ dortmund,    ajax,         1.35, 3.8, 6    ],
 [ madrid,      mancity,      1.65, 3.4, 4.8  ],

 [ donezk,      nordsjalland, 1.2,  4.5, 6.8  ],
 [ chelsea,     juventus,     1.9,  3,   3.2  ],
 [ bayern,      valencia,     1.4,  4,   7    ],
 [ lille,       borissow,     1.35, 3.5, 5.6  ],
 [ celtic,      benfica,      3,    3,   2    ],
 [ barcelona,   spartak,      1.05, 6,   12   ],
 [ braga,       cluj,         1.45, 3.4, 4.6  ],
 [ manunited,   galatasaray,  1.25, 4.5, 7.0  ]]

clr2_betathome_odds = [
  [ spartak,      celtic,       1.65, 3.5,  5.5  ],
  [ nordsjalland, chelsea,      8.2,  4.75, 1.35 ],
  [ juventus,     donezk,       1.6,  3.75, 5.5  ],
  [ borissow,     bayern,       8.5,  5.4,  1.3  ],
  [ valencia,     lille,        1.5,  3.9,  6.6  ],
  [ benfica,      barcelona,    6.1,  3.8,  1.55 ],
  [ cluj,         manunited,    5.5,  3.75, 1.6  ],
  [ galatasaray,  braga,        1.85, 3.5,  4    ],
  [ zenit,        milan,        2.25, 3.3,  3.1  ],
  [ kiew,         zagreb,       1.4,  4.15, 8.5  ],
  [ porto,        paris,        2.35, 3.1,  3.1  ],
  [ arsenal,      olympiacos,   1.3,  4.95, 10   ],
  [ schalke,      montpellier,  1.65, 3.75, 5    ],
  [ anderlecht,   malaga,       3.05, 3.25, 2.3  ],
  [ ajax,         madrid,       7,    4.6,  1.4  ],
  [ mancity,      dortmund,     1.7,  3.85, 4.45 ]]


clr2_tipp3_odds = []

Quote.create_from_ary_for_round!( clr1_tipp3_odds, tipp3, clr1 )
## Quote.create_from_ary_for_round!( clr2_tipp3_odds, tipp3, clr2 )

Quote.create_from_ary_for_round!( clr2_betathome_odds, betathome, clr2 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.cl.2012/13.2.version', :value => '1' )
