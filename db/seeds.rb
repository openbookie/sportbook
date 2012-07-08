

['services',
 'cl/teams', 'cl/cl_2011_12',
 'euro/teams', 'world/quali_2012_13',
 'mexico/teams', 'mexico/apertura_2012',
 'demo/users', 'demo/pools'].each do |seed|
  require "#{Rails.root}/db/seeds/#{seed}.rb"
end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.version', :value => '1' )
