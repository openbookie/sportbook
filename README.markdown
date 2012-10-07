# Welcome to Sportbook.

A free, open source sports betting pool in Ruby on Rails (version 3.2 and up).

Example events include:

* UEFA Champions League 2012/13
* UEFA Europa League 2011/12
* Österreichische Bundesliga 2011/12, 2012/13
* ÖFB Cup 2011/12, 2012/13
* UEFA European Football Championship aka Euro 2012
* Romania Liga 1 2012/13
* México Primera División Apertura 2012
* World Cup Quali 2012/13
* National Hockey League (NHL) 2012

For more events or leagues, see the [`sport.db`](http://geraldb.github.com/sport.db) site.

## Demo

Try the demo install running on Heroku [`sportbook.herokuapp.com`](http://sportbook.herokuapp.com).

Use the login credentials `demo`/`demo`. 


## Setup

### Setup on your local machine

Clone the Sportbook git repo:

    git clone git://github.com/geraldb/sportbook.git

Get all your Ruby libraries (gems) installed using the bundler tool:

    cd sportbook
    bundle install --without production

Note, use the `--without production` option for local development
unless you want to install the PostgreSQL (pg) database libraries and services
(required for production on the Heroku hosting service.)

Setup the database and seeds:

    rake db:setup

Showtime! Startup the server and use the `demo`/`demo` credentials to sign in:

    rails server

That's it.


### Setup on Heroku 

Clone the Sportbook git repo:

    git clone git://github.com/geraldb/sportbook.git

Create app on Heroku e.g.

    cd sportbook
    heroku create <your_app_name_here>

Upload via

    git push heroku

Create DB on first upload via

    heroku run rake db:setup

Showtime! Sign in using the  `demo`/`demo` credentials. That's it.


## License

The sportbook scripts and templates are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [Open Sports Database & Friends Forum/Mailing List](http://groups.google.com/group/opensport). Thanks!
