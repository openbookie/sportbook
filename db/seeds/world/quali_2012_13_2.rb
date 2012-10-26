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


tipp3     = Service.find_by_key!( 'tipp3' )
betathome = Service.find_by_key!( 'betathome' )




## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.world.quali.2012/13.2.version', :value => '1' )