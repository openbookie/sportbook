
desc 'sportbook: load seed data for neufang13 pools'
task :load_neufang13 => [:environment] do |t|

  require "#{Rails.root}/db/seeds/setups/neufang13/seeds.rb"

end
