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
  [ 'Clemens H',   'clemens' ],
  [ 'Gerhard W',   'gerhard.w' ],
  [ 'Michael T',   'michael.t' ],
  [ 'Karl E',      'karl.e' ],
  [ 'Gerold M',    'gerold.m' ],
  [ 'Werner F',    'werner.f' ],
  [ 'Dietmar P',   'dietmar.p' ],
  [ 'Johannes S',  'johannes' ]
]


User.create_from_ary!( users )

