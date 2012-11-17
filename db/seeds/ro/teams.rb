# encoding: utf-8

l1 = [
  [ 'astra',           'ro/astra_ploiesti.gif' ],
  [ 'ceahlau',         'ro/rapid.gif' ],
  [ 'cfr',             'ro/cfr_cluj.gif' ],
  [ 'chiajna',         'ro/concordia_chiajna.gif' ],
  [ 'iasi',            'ro/csms_iasi.gif' ],
  [ 'dinamo',          'ro/dinamo.gif' ],
  [ 'fcbrasov',         'ro/fcbrasov.gif' ],
  [ 'gazmetan_severin', 'ro/gazmetan_severin.gif' ],
  [ 'vaslui',           'ro/vaslui.gif' ],
  [ 'gazmetan_medias',  'ro/gazmetan_medias.gif' ],
  [ 'gloria_bistrita',  'ro/gloria_bistrita.gif' ],
  [ 'otelul',           'ro/otelul.gif' ],
  [ 'pandurii',         'ro/pandurii.gif' ],
  [ 'petrolul',         'ro/petrolul.gif' ],
## fix: at/rapid!!!! already taken
  [ 'rapid',            'ro/rapid.gif' ],
  [ 'steaua',              'ro/steaua.gif' ],
  [ 'u_cluj',              'ro/u_cluj.gif' ],
  [ 'viitorul_constanta',  'ro/viitorul_constanta.gif' ]
]

Team.update_image_from_ary!( l1 )

Prop.create!( key: 'db.ro.teams.2.version', value: '1' )
