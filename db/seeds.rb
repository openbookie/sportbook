
  LogDB.delete!
  WorldDB.delete!          # danger zone! deletes all records
  SportDB.delete!          # danger zone! deletes all records
  SportDB::Market.delete!  # danger zone! deletes all records


  WorldDB.read_all( find_world_db_path_from_gemfile_gitref! )
  
  SportDB.read_setup( 'setups/demo', find_football_db_path_from_gemfile_gitref! )
  
=begin  
  ## todo: fix - enable - check event keys etc.

  SportDB::Market.load( [
    'services',
    'cl/2012_13/cl'
   ])
  
  SportDB::Market.read( [
    [ 'tipp3',     'cl.2012/13',                 'cl/2012_13/cl_tipp3' ],
    [ 'betathome', 'cl.2012/13',                 'cl/2012_13/cl_betathome' ],
    [ 'tipp3',     'world.quali.euro.2012/13',   'world/quali_tipp3' ]
  ])
=end

  ['cl/teams', 'euro/teams',
   'setups/demo/users', 'setups/demo/pools'].each do |seed|
      puts "*** loading seed data in '#{seed}'..."
      require "#{Rails.root}/db/seeds/#{seed}.rb"
  end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.seeds.version', value: '1' )
