

['cl', 'euro', 'users', 'pools' ].each do |seed|
  require "#{Rails.root}/db/seeds/#{seed}.rb"
end

