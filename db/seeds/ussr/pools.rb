# encoding: utf-8

puts "*** loading seed data in seeds/ussr/pools.rb"

##############
##  Pools

ro_l1    = Event.find_by_key!( 'ro_l1_2012_13' )

aurel = User.find_by_key!( 'aurel' )

Pool.create!( :event => ro_l1,   :title => 'USS', :user => aurel, :welcome => '' )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.ussr.pools.others.version', :value => '1' )
