
# national teams
# - world cup quali

SportDb.read_setup( 'setups/2014_quali_europe', find_data_path_from_gemfile_gitref('world-cup'))

# clubs
# - champions league (europe/uefa)
# - deutsche bundesliga

SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('europe'))
SportDb.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref('de-deutschland'))

