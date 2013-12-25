# encoding: utf-8


peyton    =  User.find_by_key!( 'peyton' )
demo      =  User.find_by_key!( 'demo' )


nfl  = Event.find_by_key!( 'nfl.2013' )

pool = Pool.create!( event: nfl, title: 'Demo', user: peyton, welcome: '' )

pool.players << peyton   # also auto add admin as first player
pool.players << demo
