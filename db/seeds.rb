

SportDB.load([
   'cl/teams',
   'cl/2012_13/cl',
   'euro/teams',
   'world/quali_2012_13'
   ])

['services',
 'cl/teams', 'cl/2012_13/cl', 'cl/2012_13/cl_quotes',
 'euro/teams', 'world/quali_2012_13',
 'demo/users', 'demo/pools'].each do |seed|
    puts "*** loading seed data in '#{seed}'..."
    require "#{Rails.root}/db/seeds/#{seed}.rb"
end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.version', :value => '1' )
