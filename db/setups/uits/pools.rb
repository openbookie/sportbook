# encoding: utf-8

##############
#  Pools

cl   = Event.find_by_key!( 'cl.2014/15' )


## nn =  User.find_by_key!( 'nn' )

behrooz = User.find_by_key!( 'behroozs' )

pool = Pool.create!( event: cl,  title: 'UITS', user: behrooz, welcome: '' )
pool.players << behrooz

