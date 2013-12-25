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

bl = Event.find_by_key!( 'de.2013/14' )

pool2 = Pool.create!( event: bl, title: 'Demo', user: cristiano, welcome: '' )

pool2.players << cristiano
pool2.players << demo


cl = Event.find_by_key!( 'cl.2013/14' )

pool3 = Pool.create!( event: cl, title: 'Demo', user: wayne, welcome: '' )

pool3.players << wayne
pool3.players << demo

