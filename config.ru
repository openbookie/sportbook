# This file is used by Rack-based servers to start the application.


puts "[boot] config.ru - before require 'environment'"
require ::File.expand_path('../config/environment',  __FILE__)
puts "[boot] config.ru - after require 'environment'"


puts "[boot] config.ru - before run Application"
run Sportbook::Application
puts "[boot] config.ru - after run Application"
