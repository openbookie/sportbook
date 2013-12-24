source 'https://rubygems.org'

gem 'kramdown'     # all ruby markdown processor/engine

gem 'rails', '3.2.12'
gem 'rails-i18n'   # see https://github.com/svenfuchs/rails-i18n

gem 'sinatra', :require => 'sinatra/base'


gem 'bcrypt-ruby', '~> 3.0.0'


gem 'worlddb', '1.7.2'   # see https://github.com/geraldb/world.db.ruby
gem 'sportdb', '1.7.9'   # see https://github.com/geraldb/sport.db.ruby

gem 'activityutils', '0.1.0'   # see https://github.com/rubylibs/activityutils

####################################
## add sportdb addons/plugins

gem 'sportdb-market', '0.5.0'   # see https://github.com/openbookie/sport.db.market
gem 'sportdb-play',   '0.2.2'   # see https://github.com/openbookie/sport.db.play

##########################
## add rails engines

gem 'worlddb-admin', '0.1.1'
gem 'sportdb-admin', '0.3.0'

#########################
## add logos n flags

gem 'worlddb-flags', '0.1.0'  # use bundled country flags

gem 'sportdb-logos',    '0.1.0',  :git => 'https://github.com/sportlogos/sport.db.logos.ruby.git'
gem 'footballdb-logos', '0.1.0',  :git => 'https://github.com/sportlogos/football.db.logos.ruby.git'

###################
## add data

gem 'worlddb-data',           '9.9.9', :git => 'https://github.com/openmundi/world.db.git'

## -- national football teams

gem 'sportdb-data-world-cup',   '9.9.9', :git => 'https://github.com/openfootball/world-cup.git'
gem 'sportdb-data-africa-cup',  '9.9.9', :git => 'https://github.com/openfootball/africa-cup.git'
gem 'sportdb-data-america-cup', '9.9.9', :git => 'https://github.com/openfootball/america-cup.git'
gem 'sportdb-data-euro-cup',    '9.9.9', :git => 'https://github.com/openfootball/euro-cup.git'


## -- football clubs

gem 'sportdb-data-de',        '9.9.9', :git => 'https://github.com/openfootball/de-deutschland.git'
gem 'sportdb-data-at',        '9.9.9', :git => 'https://github.com/openfootball/at-austria.git'

#  :path => '~/github/openfootball/europe'
gem 'sportdb-data-europe', '9.9.9',    :git => 'https://github.com/openfootball/europe.git'
gem 'sportdb-data-europe-champions-league', '9.9.9',    :git => 'https://github.com/openfootball/europe-champions-league.git'


## american football (nfl teams)

gem 'sportdb-data-american-football', '9.9.9', :git => 'https://github.com/opensport/american-football.db.git'


## gem 'sportdb-data-market',    '9.9.9', :git => 'https://github.com/openbookie/football.db.market.git'


####### add mountable apps

gem 'about'      # mountable app - about - sys info pages
gem 'dbbrowser'  # mountable app




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
