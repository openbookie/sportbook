# encoding: utf-8

### add/update images to teams


bl = [
  [ 'salzburg',    'at/salzburg.png' ],
  [ 'rapid',       'at/rapid.png' ],
  [ 'admira',      'at/admira.png' ],
  [ 'austria',     'at/austria.png' ],
  [ 'sturm',       'at/sturm.png' ],
  [ 'ried',        'at/ried.png' ],
  [ 'wacker',      'at/wacker.png' ],
  [ 'mattersburg', 'at/mattersburg.png' ],
  [ 'neustadt',    'at/neustadt.png' ],
  [ 'wac',         'at/wac.png' ]
]

ersteliga = [
  [ 'ksv',       'at/ksv.png' ],
  [ 'altach',    'at/altach.png' ],
  [ 'austrial',  'at/austrial.png' ],
  [ 'stpoelten', 'at/stpoelten.png' ],
  [ 'linz',      'at/linz.png' ],
  [ 'groedig',   'at/groedig.png' ],
  [ 'lustenau',  'at/lustenau.png' ],
  [ 'vienna',    'at/vienna.png' ],
  [ 'hartberg',  'at/hartberg.png' ],
  [ 'horn',      'at/horn.png' ]
]



Team.update_image_from_ary!( bl )
Team.update_image_from_ary!( ersteliga )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.at.teams.2.version', :value => '1' )
