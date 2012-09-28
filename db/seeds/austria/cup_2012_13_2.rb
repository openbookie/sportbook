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

# cuprunde2  = Round.find_by_event_id_and_pos( cup.id, 2 )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.cup.2012/13.2.version', :value => '1' )
