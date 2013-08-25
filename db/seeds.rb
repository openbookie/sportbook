
seed = 'demo'

puts "*** loading seed data in '#{seed}'..."
require "#{Rails.root}/db/seeds/setups/#{seed}/seeds.rb"
