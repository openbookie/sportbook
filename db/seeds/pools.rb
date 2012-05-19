# encoding: utf-8

puts "*** loading seed data in seeds/pools.rb"

cl   = Event.find_by_key!( 'cl' )
euro = Event.find_by_key!( 'euro' )

lionel    =  User.find_by_email!( 'lionel' )
cristiano =  User.find_by_email!( 'cristiano' )
demo      =  User.find_by_email!( 'demo' )

pool1 = Pool.create!( :event => cl,   :title => 'Demo', :user => lionel, :welcome => '' )

pool2 = Pool.create!( :event => euro, :title => 'Demo', :user => cristiano, :welcome => '', :fix => true )
pool3 = Pool.create!( :event => euro, :title => 'Demo', :user => cristiano, :welcome => '' )


pool1.players << lionel   # also auto add admin as first player
pool1.players << demo

pool2.players << cristiano
pool2.players << demo

pool3.players << cristiano


