
# football clubs
#   - champions league (europe)

sportdb_setups = [
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


# load quotes/odds

## SportDb::Market.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'football.db.market' ) )
