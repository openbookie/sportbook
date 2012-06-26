
desc "wettpool: load euro8 seed data for flex euro pools"
task :load_euro8 => [:environment] do |t|
  
  ['euro8'].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end

desc "wettpool: load euro4 seed data for flex euro pools"
task :load_euro4 => [:environment] do |t|
  
  ['euro4'].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end