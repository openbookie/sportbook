
  LogDb.delete!
  WorldDb.delete!          # danger zone! deletes all records
  SportDb.delete!          # danger zone! deletes all records
  SportDb::Market.delete!  # danger zone! deletes all records

  WorldDb.read_setup( 'setups/sport.db.admin', find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )
 
  # national teams
  # - world cup quali

  SportDb.read_builtin
  SportDb.read_setup( 'setups/2014_quali_europe', find_data_path_from_gemfile_gitref('world-cup'))

  # clubs
  # - champions league (europe/uefa)
  # - deutsche bundesliga

  SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('europe'))
  SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('de-deutschland'))
  

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

  [ 'setups/demo/users', 'setups/demo/pools'].each do |seed|
      puts "*** loading seed data in '#{seed}'..."
      require "#{Rails.root}/db/seeds/#{seed}.rb"
  end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.seeds.version', value: '1' )
