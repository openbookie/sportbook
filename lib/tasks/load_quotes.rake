
desc 'sportbook: stats/debug'
task :sportbook_stats => [:environment] do |t|
  puts "[debug] SportDb.banner: >>#{SportDb.banner}<<"
  puts "[debug] SportDb.root: >>#{SportDb.root}<<"

  puts "[debug] SportDb::Market.banner: >>#{SportDb::Market.banner}<<"
  puts "[debug] SportDb::Market.root: >>#{SportDb::Market.root}<<"
end


desc 'sportbook: load quotes (e.g. bl_quotes_tipp3.txt)'
task :load_quotes => [:environment] do |t|
  
  SportDb::Market.delete!  ## danger zone!! delete all market tables (quotes,etc.)


  LogUtils::Logger.root.level = :debug

  SportDb::Market.read_setup( 'setups/2013_14', find_data_path_from_gemfile_gitref( 'football.db.market' ) )
end
