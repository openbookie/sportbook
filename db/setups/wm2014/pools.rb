# encoding: utf-8

##############
#  Pools

world          = Event.find_by_key!( 'world.2014' )


## nn =  User.find_by_key!( 'nn' )

dietmar = User.find_by_key!( 'dietmar' )

pool = Pool.create!( event: world,  title: 'O Jogo', user: dietmar, welcome: '' )
pool.players << dietmar

