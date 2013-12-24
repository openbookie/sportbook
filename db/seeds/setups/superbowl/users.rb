# encoding: utf-8

##############
#  Users

User.create!( name: 'Peyton MANNING',      email: 'peyton',    password: 'peyton' )

User.create!( name: 'Mike HILLIS',      email: 'demo',      password: 'demo' )

User.create!( name: 'Gerald BAUER',      email: 'gerald',    password: 'tipp', admin: true )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.superbowl.users.version', value: '1' )