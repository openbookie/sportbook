
desc 'sportbook: stats/debug'
task :sportbook_stats => [:environment] do |t|
  puts "[debug] SportDb.banner: >>#{SportDb.banner}<<"
  puts "[debug] SportDb.root: >>#{SportDb.root}<<"

  puts "[debug] SportDb::Market.banner: >>#{SportDb::Market.banner}<<"
  puts "[debug] SportDb::Market.root: >>#{SportDb::Market.root}<<"
end


desc 'sportbook: load quotes (e.g. bl_quotes_tipp3.txt)'
task :load_quotes => [:environment] do |t|
  
  SportDB::Market.delete!  ## danger zone!! delete all market tables (quotes,etc.)
  
  SportDB::Market.load( [
    'services',
    'cl/2012_13/cl',
    'at/2012_13/bl',
    'at/2012_13/cup'
   ])
  
  SportDB::Market.read( [
    [ 'tipp3',     'at.2012/13',     'at/2012_13/bl_tipp3' ],
    [ 'betathome', 'at.2012/13',     'at/2012_13/bl_betathome' ],
    [ 'tipp3',     'at.cup.2012/13', 'at/2012_13/cup_tipp3' ],
    [ 'betathome', 'at.cup.2012/13', 'at/2012_13/cup_betathome' ],
    [ 'tipp3',     'cl.2012/13',     'cl/2012_13/cl_tipp3' ],
    [ 'betathome', 'cl.2012/13',     'cl/2012_13/cl_betathome' ],
    [ 'tipp3',     'wmq.euro',       'world/quali_tipp3' ]
  ])

end