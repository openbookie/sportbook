
# national teams
# - world cup quali europe group c

SportDb.read_setup( 'setups/2014_quali_europe_c', find_data_path_from_gemfile_gitref('world-cup'))


# clubs
# - champions league (europe/uefa)
# - deutsche bundesliga
# - austrian bundesliga

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('europe'))
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('de-deutschland'))
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('at-austria'))

