# Welcome to Sportbook.

A free open source web app for sports betting (or prediction) pools in Ruby on Rails (version 3.2 and up).

Example tournaments and leagues include:

<!-- clubs -->

* UEFA Champions League
* UEFA Europa League
* Deutsche Bundesliga
* English Premier League
* México Primera División


<!-- national teams -->

* FIFA World Cup & Quali 
* UEFA Euro Cup


<!-- more sports -->

* National Hockey League (NHL)
* National Football League (NFL)


For more tournaments or leagues, see the [`sport.db`](https://github.com/geraldb/sport.db) site.

## Demo

Try the demo install running on Heroku [`sportbook.herokuapp.com`](http://sportbook.herokuapp.com).

Use the login credentials `demo`/`demo`. 


## Setup

### Setup on your local machine

Clone the Sportbook git repo:

    git clone git://github.com/openbookie/sportbook.git

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

    git clone git://github.com/openbookie/sportbook.git

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

Send them along to the [Open Sports Database & Friends Forum/Mailing List](http://groups.google.com/group/opensport).
Thanks!
