# Load the rails application

puts "[boot] environment.rb - before require 'application'"
require File.expand_path('../application', __FILE__)
puts "[boot] environment.rb - after require 'application'"



######################
# logging config

# todo/fix: configure logging here - find a better place??
#  use just an initializer??

require 'logutils/db'      # LogDb n LogDb::Models
require 'props/db'         # add ConfDb n Props model too

## require 'logutils/server'  # LogDb::Server

LogUtils::Logger.root.level = :info    # do not output debug msgs


puts "[boot] environment.rb - before Application.initialize!"
Sportbook::Application.initialize!  # Initialize the rails application
puts "[boot] environment.rb - after Application.initialize!"


# load our lookups  (todo: is there a better location/way??)
require "#{Rails.root}/lib/utils.rb"
require "#{Rails.root}/lib/lookups.rb"
require "#{Rails.root}/lib/backup.rb"
require "#{Rails.root}/lib/recalc.rb"
