
LogDb.delete!
WorldDb.delete!          # danger zone! deletes all records
SportDb.delete!          # danger zone! deletes all records
SportDb::Market.delete!  # danger zone! deletes all records

### fix: use setups/us !!!!
WorldDb.read_setup( 'setups/sport.db.admin', find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )
 

LogUtils::Logger.root.level = :debug

SportDb.read_builtin
SportDb.read_setup( 'setups/all', find_data_path_from_gemfile_gitref('american-football.db'))


[ 'setups/superbowl/users', 'setups/superbowl/pools' ].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end


Prop.create!( key: 'db.superbowl.seeds.version', value: '1' )
