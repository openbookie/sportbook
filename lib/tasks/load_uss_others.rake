
desc "load seed data for uss other pools"
task :load_uss_others => [:environment] do |t|
  
  ['austria', 'cl', 'el', 'uss/users', 'uss/pools_others' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end