# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Wettpool::Application.initialize!

# load our lookups  (todo: is there a better location/way??)
require "#{Rails.root}/lib/utils.rb"
require "#{Rails.root}/lib/lookups.rb"
require "#{Rails.root}/lib/backup.rb"
require "#{Rails.root}/lib/recalc.rb"

