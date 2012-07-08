# encoding: utf-8

puts "*** loading seed data in seeds/nhl/teams.rb"

######################################
## NHL  Teams 2012

teams = [
 [ 'newjersey',    'New Jersey Devils',   'East/Atlantic', 'nhl/devils.png' ],
 [ 'nyislanders',  'New York Islanders',  'East/Atlantic', 'nhl/islanders.png' ],
 [ 'nyrangers',    'New York Rangers',    'East/Atlantic', 'nhl/rangers.png' ],
 [ 'philadelphia', 'Philadelphia Flyers', 'East/Atlantic', 'nhl/flyers.png' ],
 [ 'pittsburgh',   'Pittsburgh Penguins', 'East/Atlantic', 'nhl/penguins.png' ],

 [ 'boston',   'Boston Bruis',        'East/Northeast', 'nhl/bruins.png' ],
 [ 'buffalo',  'Buffalo Sabres',      'East/Northeast', 'nhl/sabres.png' ],
 [ 'montreal', 'Montreal Canadiens',  'East/Northeast', 'nhl/canadiens.png' ],
 [ 'ottawa',   'Ottawa Senators',     'East/Northeast', 'nhl/senators.png' ],
 [ 'toronto',  'Toronto Maple Leafs', 'East/Northeast', 'nhl/mapleleafs.png' ],

 [ 'carolina', 'Carolina Hurricanes',   'East/Southeast', 'nhl/hurricanes.png' ],
 [ 'florida',   'Florida Panthers',     'East/Southeast', 'nhl/panthers.png' ],
 [ 'tampabay',  'Tampa Bay Lightning',  'East/Southeast', 'nhl/lightning.png' ],
 [ 'washington', 'Washington Capitals', 'East/Southeast', 'nhl/capitals.png' ],
 [ 'winnipeg',   'Winnipeg Jets',       'East/Southeast', 'nhl/jets.png' ],

 [ 'chicago',   'Chicago Blackhawks',    'West/Central', 'nhl/blackhawks.png' ],
 [ 'columbus',  'Columbus Blue Jackets', 'West/Central', 'nhl/bluejackets.png' ],
 [ 'detroit',   'Detroit Red Wings',     'West/Central', 'nhl/redwings.png' ],
 [ 'nashville',  'Nashville Predators',  'West/Central', 'nhl/predators.png' ],
 [ 'stlouis',    'St. Louis Blues',      'West/Central', 'nhl/blues.png' ],

 [ 'calgary',     'Calgary Flames',     'West/Northwest', 'nhl/flames.png' ],
 [ 'colorado',    'Colorado Avalanche', 'West/Northwest', 'nhl/avalanche.png' ],
 [ 'edmonton',    'Edmonton Oilers',    'West/Northwest', 'nhl/oilers.png' ],
 [ 'minnesota',   'Minnesota Wild',     'West/Northwest', 'nhl/wild.png' ],
 [ 'vancouver',    'Vancouver Canucks', 'West/Northwest', 'nhl/canucks.png' ],

 [ 'anaheim',      'Anaheim Ducks',     'West/Pacific', 'nhl/ducks.png' ],
 [ 'dallas',       'Dallas Stars',      'West/Pacific', 'nhl/stars.png' ],
 [ 'losangeles',   'Los Angeles Kings', 'West/Pacific', 'nhl/kings.png' ],
 [ 'phoenix',      'Phoenix Coyotes', '  West/Pacific', 'nhl/coyotes.png' ],
 [ 'sanjose',      'San Jose Sharks', '  West/Pacific', 'nhl/sharks.png' ]
]

Team.create_from_ary!( teams )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.nhl.teams.version', :value => '1' )