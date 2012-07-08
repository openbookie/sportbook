# encoding: utf-8

puts "*** loading seed data in seeds/mexico/teams.rb"

## todo: add image for Club León

teams = [
 [ 'america',   'Club América',        'México',      'mx/america.png' ],
 [ 'atlante',   'Atlante',             'Cancún',           'mx/atlante.png' ],
 [ 'atlas',     'Atlas',               'Guadalajara',      'mx/atlas.png' ],
 [ 'chivas',    'Guadalajara Chivas',  'Guadalajara',      'mx/chivas.png' ],
 [ 'cruzazul',  'Cruz Azul',           'México',      'mx/cruzazul.png' ],
 [ 'jaguares',  'Jaguares de Chiapas', 'Tuxtla Gutiérrez', 'mx/jaguares.png' ],
 [ 'leon',      'Club León',           'León' ],
 [ 'monarcas',  'Monarcas Morelia',    'Morelia',          'mx/monarcas.png' ],
 [ 'monterrey', 'Monterrey',           'Monterrey',        'mx/monterrey.png' ],
 [ 'pachuca',   'Pachuca',             'Pachuca',          'mx/pachuca.png' ],
 [ 'puebla',    'Puebla F.C. ',        'Puebla',           'mx/puebla.png' ],
 [ 'queretaro', 'Querétaro F.C.',      'Querétaro',        'mx/queretaro.png' ],
 [ 'sanluis',   'Club  San Luis',      'San Luis Potosì',  'mx/sanluis.png' ],
 [ 'slaguna',   'Santos Laguna',       'Torreón',          'mx/slaguna.png' ],
 [ 'tijuana',   'Club Tijuana',        'Tijuana',          'mx/tijuana.png' ],
 [ 'toluca',    'Toluca',              'Toluca',           'mx/toluca.png' ],
 [ 'tigres',    'Tigres UANL',         'San Nicolás de los Garza', 'mx/tigres.jpg' ],
 [ 'pumas',     'Pumas UNAM',          'México',           'mx/pumas.png' ]
]

Team.create_from_ary!( teams )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.mexico.teams.version', :value => '1' )  