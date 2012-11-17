# encoding: utf-8

##############################################
### Bundesliga & ÖFB Cup 2012/13 Update

bl  = Event.find_at_2012_13!
cup = Event.find_at_cup_2012_13!


lask          = Team.find_by_key!( 'lask' )
mattersburg   = Team.find_by_key!( 'mattersburg' )
rapid         = Team.find_by_key!( 'rapid' )
altach        = Team.find_by_key!( 'altach' )
viktoria      = Team.find_by_key!( 'viktoria' )
ried          = Team.find_by_key!( 'ried' )
sturm         = Team.find_by_key!( 'sturm' )
innsbruck     = Team.find_by_key!( 'innsbruck' )
pasching      = Team.find_by_key!( 'pasching' )
austriak      = Team.find_by_key!( 'austriak' )
lustenau      = Team.find_by_key!( 'lustenau' )
wac           = Team.find_by_key!( 'wac' )
kalsdorf      = Team.find_by_key!( 'kalsdorf' )
salzburg      = Team.find_by_key!( 'salzburg' )
vsv           = Team.find_by_key!( 'vsv' )
austria       = Team.find_by_key!( 'austria' )

# bl clubs
admira        = Team.find_by_key!( 'admira' )
wrneustadt    = Team.find_by_key!( 'wrneustadt' )

# more clubs

austrial      = Team.find_by_key!( 'austrial' )
ksv           = Team.find_by_key!( 'ksv' )
groedig       = Team.find_by_key!( 'groedig' )




cup16 = Round.find_by_event_id_and_pos!( cup.id, 3 )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.at.cup.2012/13.2.version', value: '1' )
