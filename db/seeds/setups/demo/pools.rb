# encoding: utf-8


lionel    =  User.find_by_key!( 'lionel' )
cristiano =  User.find_by_key!( 'cristiano' )
demo      =  User.find_by_key!( 'demo' )


wmq   = Event.find_by_key!( 'wmq.euro' )

pool1 = Pool.create!( event: wmq, title: 'Demo', user: lionel, welcome: '' )

pool1.players << lionel   # also auto add admin as first player
pool1.players << demo



cl = Event.find_cl_2012_13!

pool2 = Pool.create!( event: cl, title: 'Demo', user: cristiano, welcome: '' )

pool2.players << cristiano
pool2.players << demo


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.demo.pools.version', value: '1' )
