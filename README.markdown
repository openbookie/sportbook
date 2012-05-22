# Welcome to Wettpool.

A free, open source sports betting pool in Ruby on Rails (version 3.2 and up).

Example events include:

* UEFA Champions League 2012
* UEFA Europa League 2012
* Österreichische Bundesliga 2012
* ÖFB Cup 2012
* UEFA European Football Championship aka Euro 2012
* National Hockey League (NHL) 2012 (in progress)


## Demo

Try the demo install running on Heroku [wettpool.herokuapp.com](http://wettpool.herokuapp.com).

Use the login credentials demo/demo. 


## Setup on Heroku 

Clone the Wettpool git repo

    git clone ???
    
Create app on Heroku e.g.

    heroku create <your_app_name_here> --cedar ???

Upload via

    git push heroku

Create DB on first upload via

    heroku run rake db:migrate db:seed

or all-in-one alternative

    heroku run rake db:setup

That's it.

## License

The wettpool scripts and templates are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.