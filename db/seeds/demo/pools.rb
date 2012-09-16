# encoding: utf-8

puts "*** loading seed data in seeds/demo/pools.rb"


lionel    =  User.find_by_key!( 'lionel' )
cristiano =  User.find_by_key!( 'cristiano' )
demo      =  User.find_by_key!( 'demo' )


wmql   = Event.find_by_key!( 'wmql' )

pool1 = Pool.create!( :event => wmql, :title => 'Demo', :user => lionel, :welcome => '' )

pool1.players << lionel   # also auto add admin as first player
pool1.players << demo



cl = Event.find_by_key!( 'cl.2012/13' )

pool2 = Pool.create!( :event => cl, :title => 'Demo', :user => cristiano, :welcome => '' )

pool2.players << cristiano
pool2.players << demo


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.demo.pools.version', :value => '1' )
