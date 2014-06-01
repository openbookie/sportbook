
# national teams
# - world cup quali

SportDb.read_setup( 'setups/2014_quali_europe_c', find_data_path_from_gemfile_gitref( 'world' ) )


######################################
# clubs
# - champions league
# - austrian league n cup

sportdb_setups = [
  ['world',                   'teams'],
  ['de-deutschland',          'teams'],
  ['en-england',              'teams'],
  ['es-espana',               'teams'],
  ['it-italy',                'teams'],
  ['at-austria',              '2013_14'],
  ['europe-champions-league', '2013_14']
]

sportdb_setups.each do |setup|
  SportDb.read_setup( "setups/#{setup[1]}", find_data_path_from_gemfile_gitref( setup[0]) )
end

