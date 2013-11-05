
desc 'sportbook: recalc points for all pools'
task :recalc => [:environment] do |t|
  
  recalc()
  
end

desc 'sportbook: recalc points for all pools (debug)'
task :recalcd => [:environment] do |t|
  
  recalc( debug: true )
  
end



desc 'sportbook: export all users'
task :export_users => [:environment] do |t|
  
  export_users()
  
end


desc 'sportbook: auto-update fixtures'
task :update => [:environment] do |t|
  
  SportDb.update!
  
end
