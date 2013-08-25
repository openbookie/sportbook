
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


[ 'setups/demo/users', 'setups/demo/pools' ].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end


Prop.create!( key: 'db.seeds.version', value: '1' )
