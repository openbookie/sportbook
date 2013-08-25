
desc 'sportbook: load seed data for uss pools'
task :load_uss => [:environment] do |t|

  require "#{Rails.root}/db/seeds/setups/uss/seeds.rb"

end


desc 'sportbook: load data for uss pools (data.txt)'
task :load_uss_data => [:environment] do |t|
  
  update_import_export_keys()
  
  data = File.read( "#{Rails.root}/db/seeds/setups/uss/data.txt" )
  import_backup_data( data )
  
  ## todo: use new version constant for app module e.g. Wettpool::VERSION ??
  Prop.create!( key: 'db.data.uss.version', value: '1' )
  
end
