source 'https://rubygems.org'

gem 'bcrypt-ruby'
gem 'kramdown'     # all ruby markdown processor/engine

gem 'rails', '3.2.12'
gem 'rails-i18n'   # see https://github.com/svenfuchs/rails-i18n


gem "worlddb-data", "999", :git => "git://github.com/geraldb/world.db.git"  ## :path => "../world.db"
gem "sportdb-data", "999", :git => "git://github.com/geraldb/football.db.git"  ## :path => "../football.db"

gem "logutils", "0.1.0",  :git => "git://github.com/geraldb/logutils" ## :path => "../logutils"
gem "textutils", "0.3.0", :git => "git://github.com/geraldb/textutils"  ## :path => "../textutils"

gem "worlddb", "0.10.0", :git => "git://github.com/geraldb/world.db.ruby.git"   ## :path => "../world.db.ruby"
gem "sportdb", "0.10.0", :git => "git://github.com/geraldb/sport.db.ruby.git" ## :path => "../sport.db.ruby"


## gem 'worlddb',  '0.6.8'
## gem 'sportdb',  '0.9.7'  # see https://github.com/geraldb/sport.db.ruby


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