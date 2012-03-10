
## Tips for Annotate

Annotate models via

    bundle exec annotate --position before

## Tips for Heroku

Upload via

    git push heroku master

Create DB on first upload via

    heroku run rake db:migrate db:seed

Drop and recreate DB on later uploads via

    heroku pg:reset SHARED_DATABASE --confirm wettpool
    heroku run rake db:migrate db:seed
    heroku restart

Debugging. Get latest logs via

    heroku logs


## License

The wettpool scripts and templates are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.