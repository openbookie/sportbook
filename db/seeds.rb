

['services',
 'cl/teams', 'cl/cl_2012_13',
 'euro/teams', 'world/quali_2012_13',
 'demo/users', 'demo/pools'].each do |seed|
  require "#{Rails.root}/db/seeds/#{seed}.rb"
end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.version', :value => '1' )
