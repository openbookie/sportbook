###
# todo/fix: move to textutils / worlddb ??

def find_data_path_from_gemfile_gitref( name )
  puts "[debug] find_data_path( name='#{name}' )..."
  puts "load path:"
  pp $LOAD_PATH

  # escape chars for regex e.g. . becomes \.
  name_esc = name.gsub( '.', '\.' )
  name_regex = /\/(#{name_esc}-[a-z0-9]+)|(#{name_esc})\/lib$/  # e.g. /\/(beer\.db-[a-z0-9]+)|(beer\.db)\//

  candidates = []
  $LOAD_PATH.each do |path|
    if path =~ name_regex
      # cutoff trailing /lib
      candidates << path[0..-5]
    end
  end

  puts 'found candidates:'
  pp candidates

  ## use first candidate
  candidates[0]
end


  LogDb.delete!
  WorldDb.delete!          # danger zone! deletes all records
  SportDb.delete!          # danger zone! deletes all records
  SportDb::Market.delete!  # danger zone! deletes all records

  WorldDb.read_setup( 'setups/sport.db.admin', find_data_path_from_gemfile_gitref('world.db'), { skip_tags: true } )
  
  # national teams - world cup quali
  SportDb.read_setup( 'setups/all', find_data_path_from_gemfile_gitref( 'world') )
  
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

=begin
  ['cl/teams', 'euro/teams',
   'setups/demo/users', 'setups/demo/pools'].each do |seed|
      puts "*** loading seed data in '#{seed}'..."
      require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
=end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.seeds.version', value: '1' )
