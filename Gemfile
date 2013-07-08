source 'https://rubygems.org'

gem 'kramdown'     # all ruby markdown processor/engine

gem 'rails', '3.2.12'
gem 'rails-i18n'   # see https://github.com/svenfuchs/rails-i18n

gem 'bcrypt-ruby', '~> 3.0.0'

gem 'worlddb-data',       '9.9.9', :git => 'https://github.com/geraldb/world.db.git'         ## :path => '../world.db'
gem 'sportdb-data-world', '9.9.9', :git => 'https://github.com/openfootball/world.git'       ## :path => '../openfootball/world'
gem 'sportdb-data-at',    '9.9.9', :git => 'https://github.com/openfootball/at-austria.git'  ## :path => '../openfootball/at-austria'

gem 'logutils',  '0.6.0'  # see https://github.com/geraldb/logutils
gem 'textutils', '0.6.6'  # see https://github.com/geraldb/textutils

gem 'worlddb', '1.7.2'   # see https://github.com/geraldb/world.db.ruby
gem 'sportdb', '1.6.18'  # see https://github.com/geraldb/sport.db.ruby

gem 'sportdb-market', '0.3.0'   # see https://github.com/geraldb/sport.db.ruby-market
gem 'sportdb-play', '0.2.0'     # see https://github.com/geraldb/sport.db-play


group :production do
  gem 'pg'
  gem 'thin'    # use faster multiplexed (w/ eventmachine) web server 
end

group :development do
  gem 'sqlite3'
  gem 'annotate', '~> 2.4.1.beta'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'bourbon', '1.4.0'   # scss mixins (see http://thoughtbot.com/bourbon)

gem 'ri_cal'