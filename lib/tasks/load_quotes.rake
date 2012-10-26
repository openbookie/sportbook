
desc "sportbook: load quotes (e.g. bl_quotes_tipp3.txt)"
task :load_quotes => [:environment] do |t|
  
  quotes = [
    [ 'tipp3',     'at_bl_2012_13', 'at/2012_13/bl_quotes_tipp3' ],
    [ 'betathome', 'at_bl_2012_13', 'at/2012_13/bl_quotes_betathome' ],
    #[ 'tipp3',     'at_cup_2012_13', 'at/2012_13/cup_quotes_tipp3' ],
    #[ 'betathome', 'at_cup_2012_13', 'at/2012_13/cup_quotes_betathome' ],
    [ 'tipp3',     'cl.2012/13', 'cl/2012_13/cl_quotes_tipp3' ],
    [ 'betathome', 'cl.2012/13', 'cl/2012_13/cl_quotes_betathome' ],
    [ 'tipp3',     'wmq',        'world/quali_quotes_tipp3' ]
  ]

  quotes.each do |rec|
    
    puts "loading quotes in '#{rec[2]}'.txt..."
    data = File.read( "#{Rails.root}/db/seeds/#{rec[2]}.txt" )
    QuotesReader.new.load( rec[0], rec[1], data )
    
    ## adding prop.create! here ?? why? why not??
    
  end
end