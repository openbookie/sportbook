
desc "wettpool: load seed data for uss euro pools"
task :load_uss_euro => [:environment] do |t|
  
  ['services',
   'euro/teams', 'euro/2012', 'euro/2012_calc',
   'uss/users', 'uss/euro_pools' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end

desc "wettpool: load seed data for uss euro bonus questions"
task :load_uss_euro_bonus => [:environment] do |t|
  
  ['uss/euro_bonus' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end

desc "wettpool: calc points for uss euro bonus questions"
task :load_uss_euro_bonus2 => [:environment] do |t|
  
  ['uss/euro_bonus2' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end


desc "wettpool: load data for uss euro pools (euro_data.txt)"
task :load_uss_euro_data => [:environment] do |t|
  
  update_import_export_keys()
  
  data = File.read( "#{Rails.root}/db/seeds/uss/euro_data.txt" )
  import_backup_data( data )
  
  ## todo: use new version constant for app module e.g. Wettpool::VERSION ??
  Prop.create!( :key => 'db.data.uss.euro.version', :value => '1' )
  
end



