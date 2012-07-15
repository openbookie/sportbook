# Welcome to Wettpool.

A free, open source sports betting pool in Ruby on Rails (version 3.2 and up).

Example events include:

* [UEFA Champions League 2012](https://github.com/geraldb/wettpool/tree/master/db/seeds/cl)
* [UEFA Europa League 2012](https://github.com/geraldb/wettpool/tree/master/db/seeds/cl)
* [Österreichische Bundesliga 2011/12, 2012/13](https://github.com/geraldb/wettpool/tree/master/db/seeds/austria)
* [ÖFB Cup 2011/12, 2012/13](https://github.com/geraldb/wettpool/tree/master/db/seeds/austria)
* [UEFA European Football Championship aka Euro 2012](https://github.com/geraldb/wettpool/tree/master/db/seeds/euro)
* [Romania Liga 1 2012/13](https://github.com/geraldb/wettpool/tree/master/db/seeds/romania)
* [México Primera División Apertura 2012](https://github.com/geraldb/wettpool/tree/master/db/seeds/mexico)
* [World Cup Quali 2012/13](https://github.com/geraldb/wettpool/tree/master/db/seeds/world)
* [National Hockey League (NHL) 2012](https://github.com/geraldb/wettpool/tree/master/db/seeds/nhl)


## Demo

Try the demo install running on Heroku [`wettpool.herokuapp.com`](http://wettpool.herokuapp.com).

Use the login credentials `demo`/`demo`. 


## Setup

### Setup on your local machine

Clone the Wettpol git repo:

    git clone git://github.com/geraldb/wettpool.git

Get all your Ruby libraries (gems) installed using the bundler tool:

    cd wettpool
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

Clone the Wettpool git repo:

    git clone git://github.com/geraldb/wettpool.git

Create app on Heroku e.g.

    cd wettpool
    heroku create <your_app_name_here>

Upload via

    git push heroku

Create DB on first upload via

    heroku run rake db:setup

Showtime! Sign in using the  `demo`/`demo` credentials. That's it.


## License

The wettpool scripts and templates are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [Wettpool Forum/Mailing List](http://groups.google.com/group/wettpool). Thanks!