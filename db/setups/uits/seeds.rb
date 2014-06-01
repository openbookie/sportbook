
# national teams
# - world cup

sportdb_setups = [
  ['national-teams',         'all'],
  ['world-cup',              '2014']
]

sportdb_setups.each do |setup|
  SportDb.read_setup( "setups/#{setup[1]}", find_data_path_from_gemfile_gitref( setup[0]) )
end


# load quotes/odds

## SportDb::Market.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'football.db.market' ) )
