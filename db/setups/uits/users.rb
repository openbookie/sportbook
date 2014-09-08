# encoding: utf-8

##############
#  Users

users = [
  [ 'N.N.',        'nn' ],   # standard no name pool manager placeholder
  [ 'Gerald B',    'gerald',   { :admin => true } ],
  [ 'Behrooz S',   'behroozs', { :admin => true } ],
  [ 'Richard H',   'richardh', { :admin => true } ],
  [ 'Dietmar B',   'dietmarb', ],
  [ 'Manfred K',   'manfredk', ],
  [ 'Ande S',      'ande',     ],
  [ 'Franz R',     'franz',    ],
  [ 'Markus B',    'markusb'  ],
  [ 'Martina R',   'martinar' ],
  [ 'Clemens H',   'clemens' ],
  [ 'Gerhard W',   'gerhardw' ],
  [ 'Michael T',   'michaelt' ],
  [ 'Karl E',      'karle' ],
  [ 'Gerold M',    'geroldm' ],
  [ 'Werner F',    'wernerf' ],
  [ 'Dietmar P',   'dietmarp' ],
  [ 'Johannes S',  'johannes' ],
  [ 'Andreas K',   'aklaar' ],
  [ 'Mathilde K',  'mathilde' ],
  [ 'Klaus R',     'klausr' ],
  [ 'Manuela K',   'manuelak' ],
  [ 'Thomas S',     'thomas' ],
  [ 'Bettina W',    'bettinaw' ],
  [ 'Johann K',     'johannk' ],
  [ 'Elias P',      'eliasp' ],
  [ 'Lorenz P',     'lorenzp' ],
  [ 'Claudia K',    'claudiak' ],
  [ 'Behdad S',     'behdads' ],
  [ 'Mohammad K',   'mohammadk' ],
  [ 'Dalibor J',    'daliborj' ],
  [ 'Michaela W',   'michaelaw' ],
  [ 'Michael S',    'michaels' ],

  ## [ 'Andreas P',   'andreasp' ], # promi tipp 1 (Andreas Polster)
  ## [ 'Hans K',      'hansk'    ]  # promi tipp 2 (Hans Krankl)
]


User.create_from_ary!( users )

