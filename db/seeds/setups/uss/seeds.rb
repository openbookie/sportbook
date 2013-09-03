
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
# - champions league
# - austrian league n cup

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'europe' ) )
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'at-austria') )


[ 'setups/uss/users', 'setups/uss/pools' ].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end


Prop.create!( key: 'db.uss.seeds.version', value: '1' )
