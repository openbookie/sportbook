# encoding: utf-8

##############
#  Pools

world          = Event.find_by_key!( 'world.2014' )


## nn =  User.find_by_key!( 'nn' )

behrooz = User.find_by_key!( 'behroozs' )

Pool.create!( event: world,  title: 'UITS', user: behrooz, welcome: '' )

