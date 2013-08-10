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
