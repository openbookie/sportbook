
# national teams
# - world cup

sportdb_setups = [
  ['euro-cup',               'teams'],
  ['africa-cup',             'teams'],
  ['north-america-gold-cup', 'teams'],
  ['copa-america',           'teams'],
  ['world-cup',              '2014']
]

sportdb_setups.each do |setup|
  SportDb.read_setup( "setups/#{setup[1]}", find_data_path_from_gemfile_gitref( setup[0]) )
end

