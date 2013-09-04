# encoding: utf-8

##############
#  Users

users = [
  [ 'N.N.',        'nn' ],   # standard no name pool manager placeholder
  [ 'Gerald B',    'gerald',    { :admin => true } ],
  [ 'Behrooz S',   'behrooz.s', { :admin => true } ],
  [ 'Manfred K',   'manfred.k', { :admin => true } ],
  [ 'Ande S',      'ande',      { :admin => true } ],
  [ 'Richard H',   'richard.h', { :admin => true } ],
  [ 'Franz R',     'franz',     { :admin => true } ],
  [ 'Markus B',    'markus.b'  ],
  [ 'Dietmar B',   'dietmar.b' ],
  [ 'Martina R',   'martina.r' ],
  [ 'Gerhard W',   'gerhard.w' ],
  [ 'Clemens H',   'clemens' ]
]

User.create_from_ary!( users )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.uss.users.version', value: '1' )
