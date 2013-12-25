
world_quali_c  = Event.find_by_key!( 'world.quali.europe.c.2014' )

Pool.create!( event: world_quali_c,  title: 'UITS', user: behrooz, welcome: '' )
