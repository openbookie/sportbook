
desc 'sportbook: load seed data for superbowl (american football) pools'
task :load_superbowl => [:environment] do |t|

  require "#{Rails.root}/db/seeds/setups/superbowl/seeds.rb"

end
