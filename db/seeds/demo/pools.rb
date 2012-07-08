# encoding: utf-8

puts "*** loading seed data in seeds/demo/pools.rb"

wmql   = Event.find_by_key!( 'wmql' )

lionel    =  User.find_by_key!( 'lionel' )
cristiano =  User.find_by_key!( 'cristiano' )
demo      =  User.find_by_key!( 'demo' )

pool1 = Pool.create!( :event => wmql, :title => 'Demo', :user => lionel, :welcome => '' )

# pool2 = Pool.create!( :event => euro, :title => 'Demo', :user => cristiano, :welcome => '', :fix => true )
# pool3 = Pool.create!( :event => euro, :title => 'Demo', :user => cristiano, :welcome => '' )


pool1.players << lionel   # also auto add admin as first player
pool1.players << demo

# pool2.players << cristiano
# pool2.players << demo

# pool3.players << cristiano

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.demo.pools.version', :value => '1' )



