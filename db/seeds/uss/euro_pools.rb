# encoding: utf-8

puts "*** loading seed data in seeds/uss/pools_euro.rb"

##############
##  Pools

euro    =  Event.find_by_key!( 'euro' )

behrooz =  User.find_by_email!( 'behrooz' )

pool1 = Pool.create!( :event => euro, :title => 'USS EF', :user => behrooz, :fix => true, :welcome => 'Willkommenstext Hier' )
pool2 = Pool.create!( :event => euro, :title => 'USS EF', :user => behrooz,               :welcome => 'Willkommenstext Hier' )

pool1.players << behrooz   # also auto add admin as first player
pool2.players << behrooz


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.pools.euro.version', :value => '1' )