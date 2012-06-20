
desc "load more seed data for flex euro pools"
task :load_euro8 => [:environment] do |t|
  
  ['euro8'].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end