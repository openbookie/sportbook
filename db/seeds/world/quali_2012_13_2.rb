# encoding: utf-8

#################################3
# Gruppe C

ger = Team.find_by_key!( 'ger' )
fro = Team.find_by_key!( 'fro' )
irl = Team.find_by_key!( 'irl' )
kaz = Team.find_by_key!( 'kaz' )
aut = Team.find_by_key!( 'aut' )
swe = Team.find_by_key!( 'swe' )


world = Event.find_by_key!( 'wmql' )

world2 = Round.find_by_event_id_and_pos!( world.id, 2 )

tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )


world2_betathome_odds = [
 [ irl, ger, ],
 [ fro, swe, ],
 [ kaz, aut, ],
 [ ger, swe, ],
 [ fro, irl, ],
 [ aut, kaz, ]]

Quote.create_from_ary_for_round!( world2_betathome_odds, betathome, world2 )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.world.quali.2012/13.2.version', :value => '1' )