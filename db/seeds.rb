
  WorldDB.delete!          # danger zone! deletes all records
  SportDB.delete!          # danger zone! deletes all records
  SportDB::Market.delete!  # danger zone! deletes all records

  WorldDB.load([
   'countries',
   'cities',
   'at/cities',
   'de/cities'
  ])
  
  SportDB.load([
   'leagues',
   'seasons',
   'de/teams',
   'en/teams',
   'cl/teams',
   'cl/2012_13/cl',
   'euro/teams',
   'world/quali_2012_13_europe',
   'world/quali_2012_13_europe_c'
   ])
  
  SportDB.read([
    ['wmq.euro', 'world/quali_2012_13_europe_c']
  ])


=begin
['cl/teams', 'cl/2012_13/cl', 'cl/2012_13/cl_quotes',
 'euro/teams', 'world/quali_2012_13',
 'demo/users', 'demo/pools'].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end
=end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.version', :value => '1' )
