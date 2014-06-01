
sportdb_setups=[]

# national teams
# - world cup quali

# sportdb_setups +=[
#  ['world-cup', '2014_quali_europe']
# ]

sportdb_setups += [
  ['national-teams',         'all'],
  ['world-cup',              '2014']
]

=begin
# clubs
# - champions league (europe/uefa)
# - deutsche bundesliga

sportdb_setups += [
  ['world',                   'teams'],
  ['at-austria',              'teams'],
  ['en-england',              'teams'],
  ['es-espana',               'teams'],
  ['it-italy',                'teams'],
  ['de-deutschland',          '2013_14'],
  ['europe-champions-league', '2013_14']
]
=end


sportdb_setups.each do |setup|
  SportDb.read_setup( "setups/#{setup[1]}", find_data_path_from_gemfile_gitref( setup[0]) )
end

