
skip_worlddb = true
# skip_worlddb = false

### todo: use SETUP or differnt key eg. SEED= or SEEDS=
##   or something else???

if ENV['SETUP'].present?
    key = ENV['SETUP']
    puts "try setup for key >#{key}<"
else
    key = 'demo'
    puts "no SETUP=key passed along; try default (that is, #{key})"
end


LogDb.delete!
WorldDb.delete!  unless skip_worlddb       # danger zone! deletes all records
SportDb.delete!          # danger zone! deletes all records
SportDb::Market.delete!  # danger zone! deletes all records


if key == 'superbowl'
  worlddb_setup = 'us'
else
  worlddb_setup = 'sport.db.admin'
end

WorldDb.read_setup( "setups/#{worlddb_setup}", find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )  unless skip_worlddb



LogUtils::Logger.root.level = :debug

SportDb.read_builtin

[ 'seeds', 'users', 'pools' ].each do |seed|
  puts "*** loading seed data in '#{seed}'..."
  require "#{Rails.root}/db/setups/#{key}/#{seed}.rb"
end


Prop.create!( key: "db.#{key}.seeds.version", value: '1' )
