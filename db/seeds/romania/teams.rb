# encoding: utf-8

puts "*** loading seed data in seeds/romania/teams.rb"


l1 = [
  [ 'astra',              'Astra Ploiesti',         'AFC',  'ro/astra_ploiesti.gif' ],
  [ 'ceahlau',            'Ceahlaul Piatra Neamt',  'FCC',  'ro/rapid.gif' ],
  [ 'cfr',                'CFR Cluj',               'CFR',  'ro/cfr_cluj.gif' ],
  [ 'chiajna',            'Concordia Chiajna',      'CCH',  'ro/concordia_chiajna.gif' ],
  [ 'iasi',               'CSMS Iasi',              'CSI',  'ro/csms_iasi.gif' ],
  [ 'dinamo',             'Dinamo Bucuresti',       'FCD',  'ro/dinamo.gif' ],
  [ 'fcbrasov',           'FC Brasov',              'FCB',  'ro/fcbrasov.gif' ],
  [ 'gazmetan_severin',   'FC Severin',             'FCS',  'ro/gazmetan_severin.gif' ],
  [ 'vaslui',             'FC Vaslui',              'FCV',  'ro/vaslui.gif' ],
  [ 'gazmetan_medias',    'Gaz Metan Medias',       'GMM',  'ro/gazmetan_medias.gif' ],
  [ 'gloria_bistrita',    'Gloria Bistrita',        'GBS',  'ro/gloria_bistrita.gif' ],
  [ 'otelul',             'Otelul Galati',          'OTG',  'ro/otelul.gif' ],
  [ 'pandurii',           'Pandurii Tg Jiu',        'PTJ',  'ro/pandurii.gif' ],
  [ 'petrolul',           'Petrolul Ploiesti',      'PPL',  'ro/petrolul.gif' ],
  [ 'rapid',              'Rapid Bucuresti',        'RBU',  'ro/rapid.gif' ],
  [ 'steaua',             'Steaua Bucuresti',       'SBU',  'ro/steaua.gif' ],
  [ 'u_cluj',             'U Cluj',                 'UCJ',  'ro/u_cluj.gif' ],
  [ 'viitorul_constanta', 'Viitorul Constanta',     'VCT',  'ro/viitorul_constanta.gif' ]
]

Team.create_from_ary!( l1 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.romania.teams.version', :value => '1' )