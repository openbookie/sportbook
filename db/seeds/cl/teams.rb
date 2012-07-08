# encoding: utf-8

puts "*** loading seed data in seeds/cl/teams.rb"

teams = [
  [ 'inter',     'FC Internazionale Milano',  'cl/internazionale.png' ],
  [ 'marseille', 'Olympique Marseille',       'cl/marseille.png' ],
  [ 'bayern',    'FC Bayern München',         'cl/bayern.png' ],
  [ 'basel',     'FC Basel 1893',             'cl/basel.png' ],
  [ 'chelsea',   'Chelsea FC',                'cl/chelsea.png' ],
  [ 'napoli',    'SSC Napoli',                'cl/napoli.png' ],
  [ 'madrid',    'Real Madrid CF',            'cl/madrid.png' ],
  [ 'moskva',    'PFC CSKA Moskva',           'cl/moskva.png' ],
  [ 'milan',     'AC Milan',                  'cl/milan.png' ],
  [ 'benfica',   'Benfica Lissabon',          'cl/benfica.png' ],
  [ 'barcelona', 'FC Barcelona',              'cl/barcelona.png' ],
  [ 'apoel',     'APOEL Nikosia',             'cl/apoel.png' ],

  [ 'az',        'AZ Alkmaar',           'cl/az.png' ],
  [ 'valencia',  'Valencia CF',          'cl/valencia.png' ],
  [ 'schalke',   'FC Schalke 04',        'cl/schalke.png' ],
  [ 'athletic',  'Athletic Bilbao',      'cl/athletic.png' ],
  [ 'sporting',  'Sporting Lisboa',      'cl/sporting.png' ],
  [ 'metalist',  'FC Metalist Kharkiv',  'cl/metalist.png' ],
  [ 'atletico',  'Atlético Madrid',      'cl/atletico.png' ],
  [ 'hannover',  'Hannover 96',          'cl/hannover.png' ]
]

Team.create_from_ary!( teams )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.cl.teams.version', :value => '1' )
Prop.create!( :key => 'db.seeds.el.teams.version', :value => '1' )
