
desc "wettpool: load seed data for uss other pools"
task :load_uss_others => [:environment] do |t|


  SportDB.load([
   'at/teams',
   'at/2012_13/bl',
   'at/2012_13/cup',
   'euro/teams',
   'world/quali_2012_13',
   'cl/teams',
   'cl/2012_13/cl'
   ])
  
  ['services',
   'at/teams',
   'at/2012_13/bl', 'at/2012_13/bl_quotes',
   'at/2012_13/cup', 'at/2012_13/cup_quotes',
   'euro/teams', 'world/quali_2012_13',
   'cl/teams', 'cl/2012_13/cl', 'cl/2012_13/cl_quotes',
   'uss/users', 'uss/others_pools' ].each do |seed|
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
