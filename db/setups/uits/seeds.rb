
LogDb.delete!
WorldDb.delete!          # danger zone! deletes all records
SportDb.delete!          # danger zone! deletes all records
SportDb::Market.delete!  # danger zone! deletes all records


WorldDb.read_setup( 'setups/sport.db.admin', find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )


SportDb.read_builtin

# clubs
# - champions league
# - austrian league n cup

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'europe' ) )
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'at-austria') )


# load quotes/odds

## SportDb::Market.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'football.db.market' ) )



[ 'setups/uits/users', 'setups/uits/pools' ].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end


Prop.create!( key: 'db.uits.seeds.version', value: '1' )
