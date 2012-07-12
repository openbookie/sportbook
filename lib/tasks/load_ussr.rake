
desc "wettpool: load seed data for ussr pools"
task :load_ussr => [:environment] do |t|
  
  ['services',
   'romania/teams', 'romania/l1_2012_13',
   'ussr/users', 'ussr/pools'
   ].each do |seed|
     require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end
