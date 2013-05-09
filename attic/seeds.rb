
WorldDB.read_all


SportDB.load([
  'leagues',
  'seasons'
])

de = WorldDB::Models::Country.find_by_key!( 'de' )
en = WorldDB::Models::Country.find_by_key!( 'en' )
es = WorldDB::Models::Country.find_by_key!( 'es' )

SportDB.read([  
    [ 'euro/teams',    { national: true } ],
    [ 'de/teams', { club: true, country_id: de.id } ],
    [ 'en/teams', { club: true, country_id: en.id } ],
    [ 'es/teams', { club: true, country_id: es.id } ],
    [ 'cl/teams', { club: true } ]
])

SportDB.load([
   'cl/2012_13/cl',
   'world/quali_2012_13_europe'
])


SportDB.read([
    ['world.quali.euro.2012/13', 'world/quali_2012_13_europe_c']
])

