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
clr2   = Round.find_by_event_id_and_pos!( cl.id, 2 )

tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )

clr2_tipp3_odds = [
  [ spartak,      celtic,      1.45, 3.4, 4.6  ],
  [ nordsjalland, chelsea,     7,    4.5, 1.25 ],
  [ juventus,     donezk,      1.45, 3.4, 5.5  ],
  [ borissow,     bayern,      6.6,  4,   1.3  ],
  [ valencia,     lille,       1.45, 3.4, 4.6  ],
  [ benfica,      barcelona,   6,    4,   1.45 ],
  [ cluj,         manunited,   5,    3.5, 1.45 ],
  [ galatasaray,  braga,       1.7,  3.3, 3.6  ],
  [ zenit,        milan,       2,    3,   3    ],
  [ kiew,         zagreb,      1.3,  3.8, 5.8  ],
  [ porto,        paris,       2.1,  2.9, 2.9  ],
  [ arsenal,      olympiacos,  1.3,  4,   6.6  ],
  [ schalke,      montpellier, 1.45, 3.4, 5.5  ],
  [ anderlecht,   malaga,      2.4,  2.9, 2.3  ],
  [ ajax,         madrid,      6.6,  4,   1.3  ],
  [ mancity,      dortmund,    1.75, 3.6, 3.9  ]]

Quote.create_from_ary_for_round!( clr2_tipp3_odds, tipp3, clr2 )




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


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.cl.2012/13.2.version', :value => '1' )