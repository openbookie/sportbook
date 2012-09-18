# encoding: utf-8

##################################
### ÖFB Cup 2012/13 Part II


cup = Event.find_by_key!( 'at_cup_2012_13' )

cuprunde2  = Round.find_by_event_id_and_pos( cup.id, 2 )


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

games_cuprunde2 = [
  [ 1,  kalsdorf,      [], hartberg,    Time.cet('2012-09-24 19:00') ],
  [ 2,  viktoria,      [], ksv,         Time.cet('2012-09-25 16:00') ],
  [ 3,  hard,          [], altach,      Time.cet('2012-09-25 16:30') ],
  [ 4,  stegersbach,   [], salzburg,    Time.cet('2012-09-25 18:00') ],
  [ 5,  pasching,      [], austrial,    Time.cet('2012-09-25 19:00') ],
  [ 6,  austriak,      [], admira,      Time.cet('2012-09-25 19:00') ],
  [ 7,  schwechat,     [], sturm,       Time.cet('2012-09-25 19:00') ],
  [ 8,  lask,          [], groedig,     Time.cet('2012-09-25 19:00') ],
  [ 9,  stjohann,      [], lustenau,    Time.cet('2012-09-25 19:00') ],
  [ 10, sollenau,      [], wacker,      Time.cet('2012-09-25 19:00') ],
  [ 11, vsv,           [], neustadt,    Time.cet('2012-09-25 19:00') ],
  [ 12, dornbirn,      [], austria,     Time.cet('2012-09-25 20:30') ],
  [ 13, badvoeslau,    [], mattersburg, Time.cet('2012-09-26 16:00') ],
  [ 14, stflorian,     [], ried,        Time.cet('2012-09-26 19:00') ],
  [ 15, allerheiligen, [], rapid,       Time.cet('2012-09-26 19:00') ],
  [ 16, gak,           [], wac,         Time.cet('2012-09-26 20:20') ]
]

Game.create_knockouts_from_ary!( games_cuprunde2, cuprunde2 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.cup.2012/13.2.version', :value => '1' )
