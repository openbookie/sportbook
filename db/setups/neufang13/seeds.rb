
LogDb.delete!
WorldDb.delete!          # danger zone! deletes all records
SportDb.delete!          # danger zone! deletes all records
SportDb::Market.delete!  # danger zone! deletes all records

WorldDb.read_setup( 'setups/sport.db.admin', find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )
 
# national teams
# - world cup quali europe group c

SportDb.read_builtin
SportDb.read_setup( 'setups/2014_quali_europe_c', find_data_path_from_gemfile_gitref('world-cup'))


# clubs
# - champions league (europe/uefa)
# - deutsche bundesliga
# - austrian bundesliga

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('europe'))
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('de-deutschland'))
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('at-austria'))


[ 'setups/neufang13/users', 'setups/neufang13/pools' ].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.neufang13.seeds.version', value: '1' )
