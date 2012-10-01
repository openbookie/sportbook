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


cup = Event.find_by_key!( 'at_cup_2012_13' )

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
