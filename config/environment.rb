# Load the rails application

puts "[boot] environment.rb - before require 'application'"
require File.expand_path('../application', __FILE__)
puts "[boot] environment.rb - after require 'application'"


####
#

###
# todo/fix: move to textutils / worlddb ??

def find_data_path_from_gemfile_gitref( name )
  puts "[debug] find_data_path( name='#{name}' )..."
  puts "load path:"
  pp $LOAD_PATH

  # escape chars for regex e.g. . becomes \.
  name_esc = name.gsub( '.', '\.' )
  name_regex = /\/(#{name_esc}-[a-z0-9]+)|(#{name_esc})\/lib$/  # e.g. /\/(beer\.db-[a-z0-9]+)|(beer\.db)\//

  candidates = []
  $LOAD_PATH.each do |path|
    if path =~ name_regex
      # cutoff trailing /lib
      candidates << path[0..-5]
    end
  end

  puts 'found candidates:'
  pp candidates

  ## use first candidate
  candidates[0]
end



######################
# logging config

# todo/fix: configure logging here - find a better place??
#  use just an initializer??

require 'logutils/db'      # LogDb n LogDb::Models
## require 'logutils/server'  # LogDb::Server

LogUtils::Logger.root.level = :info    # do not output debug msgs


puts "[boot] environment.rb - before Application.initialize!"
Wettpool::Application.initialize!  # Initialize the rails application
puts "[boot] environment.rb - after Application.initialize!"


# load our lookups  (todo: is there a better location/way??)
require "#{Rails.root}/lib/utils.rb"
require "#{Rails.root}/lib/lookups.rb"
require "#{Rails.root}/lib/backup.rb"
require "#{Rails.root}/lib/recalc.rb"
