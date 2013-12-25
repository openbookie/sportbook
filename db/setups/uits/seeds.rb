
# clubs
# - champions league
# - austrian league n cup

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'europe' ) )
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'at-austria') )


# load quotes/odds

## SportDb::Market.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'football.db.market' ) )
