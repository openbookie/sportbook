
desc "wettpool: load seed data for uss other pools"
task :load_uss_others => [:environment] do |t|

  WorldDB.delete!          # danger zone! deletes all records
  SportDB.delete!          # danger zone! deletes all records
  SportDB::Market.delete!  # danger zone! deletes all records


  WorldDB.read_all


  SportDB.load([
   'leagues',
   'seasons',
   'at/teams',
   'at/2012_13/bl',
   'at/2012_13/cup',
   'euro/teams',
   'world/quali_2012_13_europe',
   'world/quali_2012_13_europe_c',
   'cl/teams',
   'en/teams',
   'de/teams',
   'es/teams',
   'cl/2012_13/cl'
   ])

  SportDB.read([
     ['at.2012/13',     'at/2012_13/bl'],
     ['at.cup.2012/13', 'at/2012_13/cup'],
     ['wmq.euro',       'world/quali_2012_13_europe_c']
  ])

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
    [ 'tipp3',     'wmq.euro',       'world/quali_tipp3' ]
  ])

  
  ['at/teams', 'cl/teams', 'euro/teams',
   'setups/uss/users', 'setups/uss/others_pools' ].each do |seed|
     puts "*** loading seed data in '#{seed}'..."
     require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end


desc "wettpool: load more seed data for bl cup 2 pool"
task :load_cup_ii => [:environment] do |t|
  
  [ 'at/2012_13/cup_2' ].each do |seed|
     puts "*** loading seed data in '#{seed}'..."
     require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end


desc "wettpool: load cl 2012/13 quotes for round 1"
task :load_cl_ii => [:environment] do |t|
  
  [ 'cl/2012_13/cl_2' ].each do |seed|
     puts "*** loading seed data in '#{seed}'..."
     require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end


desc "wettpool: load data for uss other pools (others_data.txt)"
task :load_uss_others_data => [:environment] do |t|
  
  update_import_export_keys()
  
  data = File.read( "#{Rails.root}/db/seeds/uss/others_data.txt" )
  import_backup_data( data )
  
  ## todo: use new version constant for app module e.g. Wettpool::VERSION ??
  Prop.create!( :key => 'db.data.uss.others.version', :value => '1' )
  
end
