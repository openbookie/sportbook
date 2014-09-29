
sportdb_setups=[]

# national teams
# - world cup quali

# sportdb_setups +=[
#  ['world-cup', '2014_quali_europe']
# ]

# sportdb_setups += [
#  ['national-teams',         'all'],
#  ['world-cup',              '2014']
# ]

# clubs
# - champions league (europe/uefa)
# - deutsche bundesliga

sportdb_setups += [
  ['clubs',          'clubs'],
  ['at-austria',     'clubs'],
  ['de-deutschland', 'clubs'],
  ['en-england',     'clubs'],
  ['es-espana',      'clubs'],
  ['it-italy',       'clubs'],
  ['fr-france',      'clubs'],
  ['ch-confoederatio-helvetica',  'clubs'],
  ['europe-champions-league',  '2014-15'],
]


sportdb_setups.each do |setup|
  SportDb.read_setup( "setups/#{setup[1]}", find_data_path_from_gemfile_gitref( setup[0]) )
end

