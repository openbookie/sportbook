# encoding: utf-8

lionel    =  User.find_by_key!( 'lionel' )
cristiano =  User.find_by_key!( 'cristiano' )
wayne     =  User.find_by_key!( 'wayne' )
demo      =  User.find_by_key!( 'demo' )


=begin
worldq   = Event.find_by_key!( 'world.quali.europe.2014' )

pool1 = Pool.create!( event: worldq, title: 'Demo', user: lionel, welcome: '' )

pool1.players << lionel   # also auto add admin as first player
pool1.players << demo
=end

=begin
bl = Event.find_by_key!( 'de.2013/14' )

pool2 = Pool.create!( event: bl, title: 'Demo', user: cristiano, welcome: '' )

pool2.players << cristiano
pool2.players << demo
=end


cl = Event.find_by_key!( 'cl.2014/15' )

pool = Pool.create!( event: cl, title: 'Demo', user: wayne, welcome: '' )

pool.players << wayne
pool.players << demo


=begin
world          = Event.find_by_key!( 'world.2014' )

pool4 = Pool.create!( event: world,  title: 'Demo', user: lionel, welcome: '' )

pool4.players << lionel   # also auto add admin as first player
pool4.players << cristiano
pool4.players << wayne
pool4.players << demo
=end
