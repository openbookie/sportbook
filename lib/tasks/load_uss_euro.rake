
desc "load seed data for uss euro pools"
task :load_uss_euro => [:environment] do |t|
  
  ['euro', 'uss/users', 'uss/pools_euro' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end