# encoding: utf-8

##############
##  Pools

at_bl      = Event.find_at_2012_13!
at_cup     = Event.find_at_cup_2012_13!
cl         = Event.find_cl_2012_13!
wm_quali   = Event.find_by_key!( 'wmq.euro' )

nn =  User.find_by_key!( 'nn' )

behrooz = User.find_by_key!( 'behroozs' )
manfred = User.find_by_key!( 'manfredk' )
ande    = User.find_by_key!( 'ande' )
 

Pool.create!( event: at_bl,     title: 'USS', user: manfred, welcome: '' )
Pool.create!( event: at_cup,    title: 'USS', user: manfred, welcome: '' )
Pool.create!( event: wm_quali,  title: 'USS', user: behrooz, welcome: '' )
Pool.create!( event: cl,        title: 'USS', user: ande,    welcome: '' )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.uss.pools.others.version', value: '1' )
