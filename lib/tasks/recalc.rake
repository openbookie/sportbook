
desc "sportbook: recalc points for all pools"
task :recalc => [:environment] do |t|
  
  recalc()
  
end

desc "sportbook: export all users"
task :export_users => [:environment] do |t|
  
  export_users()
  
end
