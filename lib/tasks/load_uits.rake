

desc 'sportbook: load data for uits pools (data.txt)'
task :load_uits_data => :environment do |t|

  update_import_export_keys()

  data = File.read( "#{Rails.root}/db/setups/uits/data.txt" )
  import_backup_data( data )

  ## todo: use new version constant for app module e.g. Wettpool::VERSION ??
  Prop.create!( key: 'db.data.uits.version', value: '1' )

end
