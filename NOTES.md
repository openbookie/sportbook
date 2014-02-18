# Sportbook Dev Tips


## Tips for Ruby Version Manager

Use Ruby 1.9+ (required by Rails 3.2+)

    rvm use 1.9.3

## Tips for Annotate

Annotate models via

    bundle exec annotate --position before



## Installation Upgrade Steps / Checklist


backup/save tips; move to `db/setup/uits/data.txt` and commit to git

backup/save users

    heroku run rake export_users --app tipp

update app on heroku

    $ git push tipp

reset db on heroku

    $ heroku pg:reset DATABASE_URL --confirm tipp

rebuild db on heroku

    $ heroku run rake db:migrate --app tipp

run db seed on heroku

    $ heroku run rake db:seed SETUP=uits --app tipp

restore tips on heroku

    $ heroku run rake load_uits_data --app tipp

restore users on heroku; paste backup data into /jobs

restart. done.

