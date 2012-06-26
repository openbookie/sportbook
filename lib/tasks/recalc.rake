
desc "wettpool: recalc points for all pools"
task :recalc => [:environment] do |t|
  
  recalc()
  
end