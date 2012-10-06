# encoding: utf-8


teams = [
  [ 'porto'   'cl/porto.png' ],
  [ 'kiew',   'cl/kiew.png' ],
  [ 'paris',  'cl/paris.png' ],
  [ 'zagreb', 'cl/zagreb.png' ],

  [ 'arsenal',     'cl/arsenal.png' ],
  [ 'schalke',     'cl/schalke.png' ],
  [ 'olympiacos',  'cl/olympiacos.png' ],
  [ 'montpellier', 'cl/montpellier.png' ],

  [ 'milan',        'cl/milan.png' ],
  [ 'zenit',        'cl/zenit.png' ],
  [ 'anderlecht',   'cl/anderlecht.png' ],
  [ 'malaga',       'cl/malaga.png' ],

  [ 'madrid',       'cl/madrid.png' ],
  [ 'mancity',      'cl/mancity.png' ],
  [ 'ajax',         'cl/ajax.png' ],
  [ 'dortmund',     'cl/dortmund.png' ],

  [ 'chelsea',      'cl/chelsea.png' ],
  [ 'donezk',       'cl/donezk.png' ],
  [ 'juventus',     'cl/juventus.png' ],
  [ 'nordsjalland', 'cl/nordsjalland.png' ],

  [ 'bayern',       'cl/bayern.png' ],
  [ 'valencia',     'cl/valencia.png' ],
  [ 'lille',        'cl/lille.png' ],
  [ 'borissow',     'cl/borissow.png' ],

  [ 'barcelona',    'cl/barcelona.png' ],
  [ 'benfica',      'cl/benfica.png' ],
  [ 'spartak',      'cl/spartak.png' ],
  [ 'celtic',       'cl/celtic.png' ],

  [ 'manunited',    'cl/manunited.png' ],
  [ 'braga',        'cl/braga.png' ],
  [ 'galatasaray',  'cl/galatasaray.png' ],
  [ 'cluj',         'cl/cluj.png' ],

###################
# more teams from cl/el 2011-12
#
  [ 'inter',        'cl/internazionale.png' ],
  [ 'marseille',    'cl/marseille.png' ],
  [ 'basel',        'cl/basel.png' ],
  [ 'napoli',       'cl/napoli.png' ],
  [ 'moskva',       'cl/moskva.png' ],
  [ 'apoel',        'cl/apoel.png' ],

  [ 'az',           'cl/az.png' ],
  [ 'athletic',     'cl/athletic.png' ],
  [ 'sporting',     'cl/sporting.png' ],
  [ 'metalist',     'cl/metalist.png' ],
  [ 'atletico',     'cl/atletico.png' ],
  [ 'hannover',     'cl/hannover.png' ]
]

Team.update_image_from_ary!( teams )


Prop.create!( :key => 'db.cl.teams.2.version', :value => '1' )
Prop.create!( :key => 'db.el.teams.2.version', :value => '1' )
