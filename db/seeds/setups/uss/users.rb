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
  [ 'Franz R',     'franz.r',   { :admin => true } ],
  [ 'Markus B',    'markus.b'  ],
  [ 'Dietmar B',   'dietmar.b' ],
  [ 'Martina R',   'martina.r' ],
  [ 'Gerhard W',   'gerhard.w' ],
  [ 'Clemens H',   'clemens' ]

#  [ 'Helmut S',    'helmut.s' ],
#  [ 'Manuela K',   'manuela.k' ],
#  [ 'Dietmar P',   'dietmar.p' ],
#  [ 'Lorenz P',    'lorenz.p' ],
#  [ 'Elias P',     'elias.p' ],
#  [ 'Andreas K',   'andreas.k' ],
#  [ 'Mathilde F',  'mathilde.f' ],
#  [ 'Bettina W',   'bettina.w' ],
#  [ 'Werner F',    'werner.f' ], 
#  [ 'Wilhelm B',   'wilhelm.b' ],
#  [ 'Behdad S',    'behdad.s' ],
#  [ 'Christian S', 'christian.s' ],
#  [ 'Dimy M',      'dimy' ],
#  [ 'Johannes S',  'johannes.s' ],
#  [ 'Andreas V',   'andy.v' ],
#  [ 'Mohammad K',  'mohammad.k' ],
#  [ 'Claudia K',   'claudia.k' ],
#  [ 'Michael S',   'micheal.s' ],
#  [ 'Miroslaw S',  'miroslaw.s' ],
#  [ 'Thomas S',    'thomas.s' ],
#  [ 'Richard T',   'richard.t' ],
#  [ 'Wolfgang S',  'wolfgang.s' ],
#  [ 'Stefan N',    'stefan' ],
#  [ 'Mike K',      'mike' ],
#  [ 'Harry P',     'harry' ],
#  [ 'Christian Z', 'christian.z' ],
#  [ 'Gerd B',      'gerd' ],
#  [ 'Aurel D',     'aurel']
]

User.create_from_ary!( users )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.uss.users.version', value: '1' )
