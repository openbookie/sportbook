# encoding: utf-8

puts "*** loading seed data in seeds/uss/pools_others2.rb"

##############
##  Pools

cl_2012_13    = Event.find_by_key!( 'cl.2012/13' )

# nn =  User.find_by_key!( 'nn' )

ande = User.find_by_key!( 'ande' )
 

Pool.create!( :event => cl_2012_13,  :title => 'USS', :user => ande, :welcome => '' )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.pools.others2.version', :value => '1' )
