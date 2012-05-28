# encoding: utf-8

puts "*** loading seed data in seeds/users.rb"

##############
##  Users

lionel     = User.create!( :name => 'Lionel MESSI',      :email => 'lionel',    :password => 'lionel' )
cristiano  = User.create!( :name => 'Cristiano RONALDO', :email => 'cristiano', :password => 'cristiano' )

demo       = User.create!( :name => 'Diego LAFATA',      :email => 'demo',      :password => 'demo' )

gerald     = User.create!( :name => 'Gerald BAUER',      :email => 'gerald',    :password => 'tipp', :admin => true )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.users.version', :value => '1' )
