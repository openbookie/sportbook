# encoding: utf-8

puts "*** loading seed data in seeds/uss/pools_others.rb"

##############
##  Pools

at_bl    = Event.find_by_key!( 'at_bl_2012_13' )
at_cup   = Event.find_by_key!( 'at_cup_2012_13' )
wm_quali = Event.find_by_key!( 'wmql' )

nn =  User.find_by_key!( 'nn' )

behrooz = User.find_by_key!( 'behroozs' )
manfred = User.find_by_key!( 'manfredk' )
 

Pool.create!( :event => at_bl,     :title => 'USS EF', :user => manfred, :welcome => '' )
Pool.create!( :event => at_cup,    :title => 'USS EF', :user => manfred, :welcome => '' )
Pool.create!( :event => wm_quali,  :title => 'USS EF', :user => behrooz, :welcome => '' )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.pools.others.version', :value => '1' )
