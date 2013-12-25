# encoding: utf-8

lionel    =  User.find_by_key!( 'lionel' )
demo      =  User.find_by_key!( 'demo' )


world   = Event.find_by_key!( 'world.2014' )

pool = Pool.create!( event: world, title: 'Demo', user: lionel, welcome: '' )

pool.players << lionel   # also auto add admin as first player
pool.players << demo

