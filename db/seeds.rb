

['cl', 'euro', 'users', 'pools' ].each do |seed|
  require "#{Rails.root}/db/seeds/#{seed}.rb"
end

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.version', :value => '1' )
