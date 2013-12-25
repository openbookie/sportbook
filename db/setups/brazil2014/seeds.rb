
# national teams
# - world cup

sportdb_setups=[
  ['euro-cup',    'teams'],
  ['africa-cup',  'teams'],
  ['america-cup', 'teams'],
  ['world-cup',   'all']       # todo/fix: only include 2014 ???
]

sportdb_setups.each do |setup|
  SportDb.read_setup( "setups/#{setup[1]}", find_data_path_from_gemfile_gitref( setup[0]) )
end
