# Wettpool Dev Tips


## Tips for Ruby Version Manager

Use Ruby 1.9+ (required by Rails 3.2+)

    rvm use 1.9.3

## Tips for Bundler

Setup without production env (needs PostgreSQL)

    bundle install --without production

## Tips for Annotate

Annotate models via

    bundle exec annotate --position before
    
## Tips for Heroku

Drop and recreate DB on later uploads via

    heroku pg:reset SHARED_DATABASE --confirm wettpool
    heroku run rake db:migrate db:seed
    heroku restart

Debugging. Get latest logs via

    heroku logs
    

