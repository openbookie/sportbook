# encoding: utf-8

puts "*** loading seed data in seeds/uss/pools_others.rb"

##############
##  Pools

cl  = Event.find_by_key!( 'cl' )
el  = Event.find_by_key!( 'el' )
bl  = Event.find_by_key!( 'bl' )
ofb = Event.find_by_key!( 'ofb' )

behrooz =  User.find_by_email!( 'behrooz' )
ande    =  User.find_by_email!( 'ande' )
manfred =  User.find_by_email!( 'manfred' )

Pool.create!( :event => cl,  :title => 'USS EF', :user => behrooz, :welcome => '' )
Pool.create!( :event => el,  :title => 'USS EF', :user => ande,    :welcome => '' )
Pool.create!( :event => bl,  :title => 'USS EF', :user => manfred, :welcome => '' )
Pool.create!( :event => ofb, :title => 'USS EF', :user => manfred, :welcome => '' )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.pools.others.version', :value => '1' )
