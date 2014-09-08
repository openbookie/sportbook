
####
# e.g. use like
#   rake db:seed WORLD=f   or
#   rake db:seed WORLDDB=skip

skip_worlddb_str =  ENV['WORLD'] || ENV['WORLDDB']

if skip_worlddb_str.present? && ['f', 'false', 'skip'].include?( skip_worlddb_str )
  skip_worlddb = true
  puts 'skipping setup for world.db'
else
  skip_worlddb = false
end


##########
# e.g. use like
#   rake db:seed SETUP=brazil2014  or
#   rake db:seed SETUP=superbowl   etc.

### todo: use SETUP or differnt key eg. SEED= or SEEDS=
##   or something else???

key_str = ENV['SETUP']

if key_str.present?
    key = key_str
    puts "try setup for key >#{key}<"
else
    key = 'brazil2014'
    puts "no SETUP=key passed along; try default (that is, #{key})"
end


LogDb.delete!
## add ConfDb.delete! ??
WorldDb.delete!  unless skip_worlddb       # danger zone! deletes all records
## add TagDb.delete! ??

SportDb.delete!          # danger zone! deletes all records

### SportDb::Market.delete!  # danger zone! deletes all records


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
