# encoding: utf-8

puts "*** loading seed data in seeds/austria/teams.rb"


bl = [
  [ 'salzburg',    'FC RB Salzburg',      'RBS',  'at/salzburg.png' ],
  [ 'rapid',       'SK Rapid Wien',       'RAP',  'at/rapid.png' ],
  [ 'admira',      'FC Admira Wacker',    'ADM',  'at/admira.png' ],
  [ 'austria',     'FK Austria Wien',     'FAK',  'at/austria.png' ],
  [ 'sturm',       'SK Sturm Graz',       'STU',  'at/sturm.png' ],
  [ 'ried',        'SV Ried',             'RIE',  'at/ried.png' ],
  [ 'wacker',      'FC Wacker Innsbruck', 'IBK',  'at/wacker.png' ],
  [ 'mattersburg', 'SV Mattersburg',      'SVM',  'at/mattersburg.png' ],
  [ 'neustadt',    'SC Wiener Neustadt',  'WRN',  'at/neustadt.png' ],
  [ 'wac',         'Wolfsberger AC',      'WAC',  'at/wac.png' ]
]

ersteliga = [
  [ 'ksv',       'Kapfenberger SV 1919', 'Erste Liga/Stmk.', 'KSV',  'at/ksv.png' ],
  [ 'altach',    'SCR Altach',           'Erste Liga/Vbg.',  'ALT',  'at/altach.png' ],
  [ 'austrial',  'SC Austria Lustenau',  'Erste Liga/Vbg.',  'LUS',  'at/austrial.png' ],
  [ 'stpoelten', 'SKN St. Pölten',       'Erste Liga/NÖ',    'POE',  'at/stpoelten.png' ],
  [ 'linz',      'FC Blau-Weiß Linz',    'Erste Liga/OÖ',    'BWL',  'at/linz.png' ],
  [ 'groedig',   'SV Grödig',            'Erste Liga/Sbg.',  'GRO',  'at/groedig.png' ],
  [ 'lustenau',  'FC Lustenau 1907',     'Erste Liga/Vbg.',  'LUS',  'at/lustenau.png' ],
  [ 'vienna',    'Vienna FC 1894',       'Erste Liga/Wien',  'VIE',  'at/vienna.png' ],
  [ 'hartberg',  'TSV Hartberg',         'Erste Liga/Stmk.', 'HAR',  'at/hartberg.png' ],
  [ 'horn',      'SV Horn',              'Erste Liga/NÖ',    'HOR',  'at/horn.png' ]
]

rlwest = [
  [ 'hard',     'FC Hard',               'Regionalliga West/Vbg.',  'HAR' ],
  [ 'bregenz',  'SC Bregenz',            'Regionalliga West/Vbg.',  'BRE' ],
  [ 'dornbirn', 'FC Dornbirn 1913',      'Regionalliga West/Vbg.',  'DOR' ],
  [ 'kufstein', 'FC Kufstein',           'Regionalliga West/Tirol', 'KUF' ],
  [ 'wattens',  'WSG Wattens',           'Regionalliga West/Tirol', 'WAT' ],
  [ 'austrias', 'SV Austria Salzburg',   'Regionalliga West/Sbg.',  'AUS' ],
  [ 'pinzgau',  'FC Pinzgau Saalfelden', 'Regionalliga West/Sbg.',  'PIN' ],
  [ 'stjohann', 'TSV St. Johann',        'Regionalliga West/Sbg.',  'STJ' ]
]

rlmitte = [
  [ 'vsv' ,          'Villacher SV',           'Regionalliga Mitte/Ktn.', 'VSV' ],
  [ 'klagenfurt',    'SAK Celovec/Klagenfurt', 'Regionalliga Mitte/Ktn.', 'CEL' ],
  [ 'austriak',      'SK Austria Klagenfurt',  'Regionalliga Mitte/Ktn.', 'KLA' ],
  [ 'kalsdorf',      'SC Kalsdorf',            'Regionalliga Mitte/Stmk.', 'KAL' ],
  [ 'gratkorn',      'FC Gratkorn',            'Regionalliga Mitte/Stmk.', 'GRA' ],
  [ 'allerheiligen', 'SV Allerheiligen',       'Regionalliga Mitte/Stmk.', 'ALL' ],
  [ 'leoben',        'DSV Leoben',             'Regionalliga Mitte/Stmk.', 'LEO' ],
  [ 'gak',           'Grazer AK',              'Regionalliga Mitte/Stmk.', 'GAK' ],
  [ 'pasching',      'FC Pasching',            'Regionalliga Mitte/OÖ',   'PAS' ],
  [ 'voecklamarkt',  'Vöcklamarkt',            'Regionalliga Mitte/OÖ',  'VOE'  ],
  [ 'stflorian',     'St. Florian',            'Regionalliga Mitte/OÖ',  'STF'  ],
  [ 'wallern',       'Wallern',                'Regionalliga Mitte/OÖ',  'WAL'  ],
  [ 'lask',          'LASK Linz',              'Regionalliga Mitte/OÖ',  'LAS'  ]
]

rlost = [
  [ 'sollenau',    '1. SC Sollenau',       'Regionalliga Ost/OÖ',    'SOL' ],
  [ 'amstetten',   'SKU Amstetten',        'Regionalliga Ost/NÖ',    'AMS' ],
  [ 'retz',        'SV Retz',              'Regionalliga Ost/NÖ',    'RET' ],
  [ 'fac' ,        'FAC Team für Wien',    'Regionalliga Ost/Wien',  'FAC' ],
  [ 'schwechat',   'SV Schwechat',         'Regionalliga Ost/Wien',  'SCH' ],
  [ 'wienersk',    'Wiener SK',            'Regionalliga Ost/Wien',  'WIE' ],
  [ 'ostbahn',     'SC Ostbahn XI',        'Regionalliga Ost/Wien',  'OST' ],
  [ 'oberwart',    'SV Oberwart',          'Regionalliga Ost/Bgld.', 'OBE' ],
  [ 'parndorf',    'SC/ESV Parndorf 1919', 'Regionalliga Ost/Bgld.', 'PAR' ],
  [ 'stegersbach', 'SV Stegersbach',       'Regionalliga Ost/Bgld.', 'STE' ]
]

misc = [
  [ 'wolfurt',       'FC Wolfurt',            'Vorarlberg Liga',  'WOL' ],
  [ 'schwaz',        'SC Schwaz',             'Tirol Liga',       'SCH' ],
  [ 'reutte',        'SV Reutte',             'Tirol Liga',       'REU' ],
  [ 'spittal',       'SV Spittal/Drau',       'Kärntner Liga',    'SPI' ],
  [ 'sak',           'SAK 1914',              'Salzburger Liga',  'SAK' ],
  [ 'dsc',           'Deutschlandsberger SC', 'Landesliga/Stmk.', 'DSC' ],
  [ 'micheldorf',    'SV Micheldorf',         'OÖ Liga',          'MIC' ],
  [ 'badvoeslau',    'ASK Bad Vöslau',        'Landesliga/NÖ',    'VOE' ],
  [ 'gaflenz',       'SV Gaflenz',            'Landesliga/NÖ',    'GAF' ],
  [ 'ardagger',      'Ardagger SCU',          'Landesliga/NÖ',    'ARD' ],
  [ 'rohrendorf',    'SC Rohrendorf',         '2. Landesliga West/NÖ', 'ROH' ],
  [ 'heiligenkreuz', 'SV Heiligenkreuz',      '2. Liga Süd/NÖ',   'HEI' ],
  [ 'viktoria',      'Wiener Viktoria',       'Wiener Stadtliga', 'VIK' ],
  [ 'juniors',       'FC RB Juniors Salzburg' ]
]


Team.create_from_ary!( bl )
Team.create_from_ary!( ersteliga )
Team.create_from_ary!( rlwest )
Team.create_from_ary!( rlmitte )
Team.create_from_ary!( rlost )
Team.create_from_ary!( misc )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.teams.version', :value => '1' )
