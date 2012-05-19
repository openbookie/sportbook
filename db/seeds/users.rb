# encoding: utf-8

puts "*** loading seed data in seeds/users.rb"

##############
##  Users

lionel     = User.create!( :name => 'Lionel MESSI',      :email => 'lionel',    :password => 'lionel' )
cristiano  = User.create!( :name => 'Cristiano RONALDO', :email => 'cristiano', :password => 'cristiano' )

demo       = User.create!( :name => 'Diego LAFATA',      :email => 'demo',      :password => 'demo' )

### todo: remove old test/demo users

behrooz    = User.create!( :name => 'Behrooz SEIFI',     :email => 'behrooz',   :password => 'tipp' )
gerald     = User.create!( :name => 'Gerald BAUER',      :email => 'gerald',    :password => 'tipp' )
