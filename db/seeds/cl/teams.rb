# encoding: utf-8

puts "*** loading seed data in seeds/cl/teams.rb"

teams = [
  [ 'porto',        'FC Porto',             'cl/porto.png' ],
  [ 'kiew',         'Dynamo Kiew',          'cl/kiew.png' ],
  [ 'paris',        'Paris St. Germain',    'cl/paris.png' ],
  [ 'zagreb',       'Dinamo Zagreb',        'cl/zagreb.png' ],

  [ 'arsenal',      'FC Arsenal',           'cl/arsenal.png' ],
  [ 'schalke',      'FC Schalke 04',        'cl/schalke.png' ],
  [ 'olympiacos',   'Olympiakos Piräus',    'cl/olympiacos.png' ],
  [ 'montpellier',  'HSC Montpellier',      'cl/montpellier.png' ],

  [ 'milan',        'AC Mailand',           'cl/milan.png' ],
  [ 'zenit',        'Zenit St. Petersburg', 'cl/zenit.png' ],
  [ 'anderlecht',   'RSC Anderlecht',       'cl/anderlecht.png' ],
  [ 'malaga',       'FC Málaga',            'cl/malaga.png' ],

  [ 'madrid',       'Real Madrid',          'cl/madrid.png' ],
  [ 'mancity',      'Manchester City',      'cl/mancity.png' ],
  [ 'ajax',         'Ajax Amsterdam',       'cl/ajax.png' ],
  [ 'dortmund',     'Borussia Dortmund',    'cl/dortmund.png' ],

  [ 'chelsea',      'FC Chelsea',           'cl/chelsea.png' ],
  [ 'donezk',       'Schachtjor Donezk',    'cl/donezk.png' ],
  [ 'juventus',     'Juventus Turin',       'cl/juventus.png' ],
  [ 'nordsjalland', 'FC Nordsjælland',      'cl/nordsjalland.png' ],

  [ 'bayern',    'Bayern München',          'cl/bayern.png' ],
  [ 'valencia',  'FC Valencia',             'cl/valencia.png' ],
  [ 'lille',     'OSC Lille',               'cl/lille.png' ],
  [ 'borissow',  'BATE Borissow',           'cl/borissow.png' ],

  [ 'barcelona', 'FC Barcelona',             'cl/barcelona.png' ],
  [ 'benfica',   'Benfica Lissabon',         'cl/benfica.png' ],
  [ 'spartak',   'Spartak Moskau',           'cl/spartak.png' ],
  [ 'celtic',    'Celtic Glasgow',           'cl/celtic.png' ],

  [ 'manunited',   'Manchester United',      'cl/manunited.png' ],
  [ 'braga',       'Sporting Braga',         'cl/braga.png' ],
  [ 'galatasaray', 'Galatasaray',            'cl/galatasaray.png' ],
  [ 'cluj',        'CFR Cluj',               'cl/cluj.png' ],

###################
# more teams from cl/el 2011-12
#
  [ 'inter',     'FC Internazionale Milano',  'cl/internazionale.png' ],
  [ 'marseille', 'Olympique Marseille',       'cl/marseille.png' ],
  [ 'basel',     'FC Basel 1893',             'cl/basel.png' ],
  [ 'napoli',    'SSC Napoli',                'cl/napoli.png' ],
  [ 'moskva',    'PFC CSKA Moskva',           'cl/moskva.png' ],
  [ 'apoel',     'APOEL Nikosia',             'cl/apoel.png' ],

  [ 'az',        'AZ Alkmaar',           'cl/az.png' ],
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
