
  WorldDB.delete!          # danger zone! deletes all records
  SportDB.delete!          # danger zone! deletes all records
  SportDB::Market.delete!  # danger zone! deletes all records


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

  SportDB::Market.load( [
    'services',
    'cl/2012_13/cl'
   ])
  
  SportDB::Market.read( [
    [ 'tipp3',     'cl.2012/13',                 'cl/2012_13/cl_tipp3' ],
    [ 'betathome', 'cl.2012/13',                 'cl/2012_13/cl_betathome' ],
    [ 'tipp3',     'world.quali.euro.2012/13',   'world/quali_tipp3' ]
  ])
  
  ['cl/teams', 'euro/teams',
   'setups/demo/users', 'setups/demo/pools'].each do |seed|
      puts "*** loading seed data in '#{seed}'..."
      require "#{Rails.root}/db/seeds/#{seed}.rb"
  end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.seeds.version', value: '1' )
