
desc "load seed data for uss other pools"
task :load_uss_others => [:environment] do |t|
  
  ['austria', 'cl', 'el', 'uss/users', 'uss/others_pools' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end

desc "load data for uss other pools (others_data.txt)"
task :load_uss_others_data => [:environment] do |t|
  
  update_import_export_keys()
  
  data = File.read( "#{Rails.root}/db/seeds/uss/others_data.txt" )
  import_backup_data( data )
  
  ## todo: use new version constant for app module e.g. Wettpool::VERSION ??
  Prop.create!( :key => 'db.data.uss.others.version', :value => '1' )
  
end
