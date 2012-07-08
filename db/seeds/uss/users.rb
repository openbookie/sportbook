# encoding: utf-8

puts "*** loading seed data in seeds/uss/users.rb"

##############
#  Users

users = [
  [ 'N.N.',        'nn' ],   # standard no name pool manager placeholder
  [ 'Gerald B',    'gerald',    { :admin => true } ],
  [ 'Behrooz S',   'behrooz.s', { :admin => true } ],
  [ 'Manfred K',   'manfred.k', { :admin => true } ],
  [ 'Ande S',      'ande',      { :admin => true } ],
  [ 'Helmut S',    'helmut.s' ],
  [ 'Clemens H',   'clemens' ],
  [ 'Markus B',    'markus.b' ],
  [ 'Richard H',   'richard.h' ],
  [ 'Manuela K',   'manuela.k' ],
  [ 'Dietmar P',   'dietmar.p' ],
  [ 'Lorenz P',    'lorenz.p' ],
  [ 'Elias P',     'elias.p' ],
  [ 'Franz R',     'franz.r' ],
  [ 'Martina R',   'martina.r' ],
  [ 'Andreas K',   'andreas.k' ],
  [ 'Mathilde F',  'mathilde.f' ],
  [ 'Dietmar B',   'dietmar.b' ],
  [ 'Bettina W',   'bettina.w' ],
  [ 'Werner F',    'werner.f' ], 
  [ 'Wilhelm B',   'wilhelm.b' ],
  [ 'Behdad S',    'behdad.s' ],
  [ 'Christian S', 'christian.s' ],
  [ 'Dimy M',      'dimy' ],
  [ 'Johannes S',  'johannes.s' ],
  [ 'Andreas V',   'andy.v' ],
  [ 'Mohammad K',  'mohammad.k' ],
  [ 'Claudia K',   'claudia.k' ],
  [ 'Michael S',   'micheal.s' ],
  [ 'Miroslaw S',  'miroslaw.s' ],
  [ 'Thomas S',    'thomas.s' ],
  [ 'Richard T',   'richard.t' ],
  [ 'Wolfgang S',  'wolfgang.s' ],
  [ 'Stefan N',    'stefan' ],
  [ 'Mike K',      'mike' ],
  [ 'Harry P',     'harry' ],
  [ 'Christian Z', 'christian.z' ]
]

User.create_from_ary!( users )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.users.version', :value => '1' )
