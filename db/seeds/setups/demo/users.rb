# encoding: utf-8

##############
#  Users

User.create!( name: 'Lionel MESSI',      email: 'lionel',    password: 'lionel' )
User.create!( name: 'Cristiano RONALDO', email: 'cristiano', password: 'cristiano' )
User.create!( name: 'Wayne ROONEY',      email: 'wayne',     password: 'wayne' )

User.create!( name: 'Diego LAFATA',      email: 'demo',      password: 'demo' )

User.create!( name: 'Gerald BAUER',      email: 'gerald',    password: 'tipp', admin: true )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.demo.users.version', value: '1' )