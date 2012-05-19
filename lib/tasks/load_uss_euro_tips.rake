
desc "load seed data for uss euro pools (tips) - part ii"
task :load_uss_euro_tips => [:environment] do |t|
  
  ['uss/tips_euro' ].each do |seed|
    require "#{Rails.root}/db/seeds/#{seed}.rb"
  end
  
end