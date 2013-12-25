# encoding: utf-8

##############
#  Pools

wq  = Event.find_by_key!( 'world.quali.europe.c.2014' )

at  = Event.find_by_key!( 'at.2013/14' )
de  = Event.find_by_key!( 'de.2013/14' )

cl  = Event.find_by_key!( 'cl.2013/14' )


gerald  = User.find_by_key!( 'gerald'  )
franz   = User.find_by_key!( 'franz'   )
franzsr = User.find_by_key!( 'franzsr' )


pool_wq = Pool.create!( event: wq, title: 'Tipp 13', user: franz, welcome: '' )
pool_at = Pool.create!( event: at, title: 'Tipp 13', user: franz, welcome: '' )
pool_de = Pool.create!( event: de, title: 'Tipp 13', user: franz, welcome: '' )
pool_cl = Pool.create!( event: cl, title: 'Tipp 13', user: franz, welcome: '' )

pool_wq.players << franz   # also auto add admin as first player
pool_wq.players << franzsr
pool_wq.players << gerald

pool_at.players << franz   # also auto add admin as first player
pool_at.players << gerald

pool_de.players << franz   # also auto add admin as first player
pool_de.players << gerald

pool_cl.players << franz   # also auto add admin as first player
pool_cl.players << franzsr
pool_cl.players << gerald
