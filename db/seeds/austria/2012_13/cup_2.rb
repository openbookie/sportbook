# encoding: utf-8

##################################
### ÖFB Cup 2012/13 Part II

puts "*** loading seed data in seeds/austria/cup_2012_13_2.rb"

cup = Event.find_by_key!( 'at_cup_2012_13' )

bl = Event.find_by_key!( 'at_bl_2012_13' )


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





tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )



cup16 = Round.find_by_event_id_and_pos!( cup.id, 3 )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.cup.2012/13.2.version', :value => '1' )
