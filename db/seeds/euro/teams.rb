# encoding: utf-8

puts "*** loading seed data in seeds/euro/teams.rb"


teams = [
  [ 'pol', 'Polen',        'POL', 'euro/poland2.png' ],
  [ 'gre', 'Griechenland', 'GRE', 'euro/greece2.png' ],
  [ 'rus', 'Russland',     'RUS', 'euro/russia2.png' ],
  [ 'cze', 'Tschechien',   'CZE', 'euro/czech_republic2.png' ],
  [ 'ned', 'Niederlande',  'NED', 'euro/netherlands2.png' ],
  [ 'den', 'Dänemark',     'DEN', 'euro/denmark2.png' ],
  [ 'ger', 'Deutschland',  'GER', 'euro/germany2.png' ],
  [ 'por', 'Portugal',     'POR', 'euro/portugal2.png' ],
  [ 'esp', 'Spanien',      'ESP', 'euro/spain2.png' ],
  [ 'ita', 'Italien',      'ITA', 'euro/italy2.png' ],
  [ 'irl', 'Irland',       'IRL', 'euro/ireland2.png' ],
  [ 'cro', 'Kroatien',     'CRO', 'euro/croatia2.png' ],
  [ 'ukr', 'Ukraine',      'UKR', 'euro/ukraine2.png' ],
  [ 'swe', 'Schweden',     'SWE', 'euro/sweden2.png' ],
  [ 'fra', 'Frankreich',   'FRA', 'euro/france2.png' ],
  [ 'eng', 'England',      'ENG', 'euro/england2.png' ],
  [ 'fro', 'Färöer',       'FRO', 'euro/faroer2.png' ],
  [ 'kaz', 'Kasachstan',   'KAZ', 'euro/kaz2.png' ],
  [ 'aut', 'Österreich',   'AUT', 'euro/austria2.png' ]
]



Team.create_from_ary!( teams )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.teams.version', :value => '1' )
