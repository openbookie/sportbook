# encoding: utf-8


lionel    =  User.find_by_key!( 'lionel' )
cristiano =  User.find_by_key!( 'cristiano' )
demo      =  User.find_by_key!( 'demo' )


worldq   = Event.find_by_key!( 'world.quali.europe.2014' )

pool1 = Pool.create!( event: worldq, title: 'Demo', user: lionel, welcome: '' )

pool1.players << lionel   # also auto add admin as first player
pool1.players << demo



bl = Event.find_by_key!( 'de.2013/14' )

pool2 = Pool.create!( event: bl, title: 'Demo', user: cristiano, welcome: '' )

pool2.players << cristiano
pool2.players << demo


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.demo.pools.version', value: '1' )
