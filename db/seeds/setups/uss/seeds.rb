
LogDb.delete!
WorldDb.delete!          # danger zone! deletes all records
SportDb.delete!          # danger zone! deletes all records
SportDb::Market.delete!  # danger zone! deletes all records


WorldDb.read_setup( 'setups/sport.db.admin', find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )

# national teams
# - world cup quali

SportDb.read_builtin
SportDb.read_setup( 'setups/2014_quali_europe_c', find_data_path_from_gemfile_gitref( 'world') )


# clubs
# - austrian league n cup

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'at-austria') )


=begin
  SportDB::Market.load( [
    'services',
    'cl/2012_13/cl',
    'at/2012_13/bl',
    'at/2012_13/cup'
   ])
  
  SportDB::Market.read( [
    [ 'tipp3',     'at.2012/13',     'at/2012_13/bl_tipp3' ],
    [ 'betathome', 'at.2012/13',     'at/2012_13/bl_betathome' ],
    [ 'tipp3',     'at.cup.2012/13', 'at/2012_13/cup_tipp3' ],
    [ 'betathome', 'at.cup.2012/13', 'at/2012_13/cup_betathome' ],
    [ 'tipp3',     'cl.2012/13',     'cl/2012_13/cl_tipp3' ],
    [ 'betathome', 'cl.2012/13',     'cl/2012_13/cl_betathome' ],
    [ 'tipp3',     'world.quali.euro.2012/13', 'world/quali_tipp3' ]
  ])
=end

[ 'setups/uss/users', 'setups/uss/pools' ].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end


Prop.create!( key: 'db.uss.seeds.version', value: '1' )
