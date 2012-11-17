# encoding: utf-8

#################################3
# Gruppe C

ger = Team.find_by_key!( 'ger' )
fro = Team.find_by_key!( 'fro' )
irl = Team.find_by_key!( 'irl' )
kaz = Team.find_by_key!( 'kaz' )
aut = Team.find_by_key!( 'aut' )
swe = Team.find_by_key!( 'swe' )


world = Event.find_by_key!( 'wmq.euro' )




## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.world.quali.2012/13.2.version', value: '1' )