

desc 'sportbook: load data for uits pools (data.txt)'
task :load_uits_data => :environment do |t|

  update_import_export_keys()

  data = File.read( "#{Rails.root}/db/setups/uits/data.txt" )
  import_backup_data( data )

  ## todo: use new version constant for app module e.g. Wettpool::VERSION ??
  Prop.create!( key: 'db.data.uits.version', value: '1' )

end

desc 'sportbook: patch data for uits pools'
task :patch_uits_data => :environment do |t|

  LogUtils::Logger.root.level = :debug

  reader = SportDb::GameReader.new( "#{Rails.root}/db/setups" )
  reader.read( 'uits/2013_14/cl' )

  puts 'Done w/ patch cl'

end


desc 'sportbook: cleanup database; remove non essential records'
task :cleanup => :environment do |t|

  LogUtils::Logger.root.level = :debug

  TagDb::Model::Tagging.delete_all
  TagDb::Model::Tag.delete_all
  
  WorldDb::Model::City.delete_all
  WorldDb::Model::Region.delete_all
  ## todo: delete places
  #    where type = city or region

  puts 'Done cleanup'
end


task :check => :environment do |t|

  LogUtils::Logger.root.level = :debug

  user_ids = {}

  ## check tips w/o valid user_id
  SportDb::Model::Tip.order(:id).each do |tip|
    user_id = tip.user_id
    
    continue  if user_ids[ user_id ]    ## already verified/checked    

    user = SportDb::Model::User.find_by_id( user_id )
    if user
      user_ids[ user_id ] = true
      print '.'
    else
      ### user_id invalid!!!!
      puts "invalid tip w/ user_id #{user_id}"
    end
    puts 'Done check'  
  end

end


