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


Check remotes for git repo

    git remote -v

Add heroku remote to git reop

    git remote add heroku git@heroku.com:sportbook.git

### Troubleshooting

    $ git push heroku
    
    Permission denied (publickey).
    fatal: The remote end hung up unexpectedly

Add new public key to heroku. E.g. issue the command:

    $ heroku keys:add

Will result in:

    Found existing public key: C:/Users/gerald/.ssh/id_rsa.pub
    Uploading SSH public key C:/Users/gerald/.ssh/id_rsa.pub... done





