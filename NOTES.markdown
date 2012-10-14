# Sportbook Dev Tips


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

Option 1a) Old command (before migration to postgres.heroku.com dev plan) using shared db

    heroku pg:reset SHARED_DATABASE --confirm sportbook

Option 1b) New command (using postgres.heroku.com dev plan)

    heroku pg:reset DATABASE_URL --confirm sportbook

    heroku run rake db:migrate db:seed
    heroku restart

Debugging. Get latest logs via

    heroku logs
    

