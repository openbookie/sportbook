# encoding: utf-8

######################################
## NHL  Teams 2012

teams = [
 [ 'newjersey',    'nhl/devils.png' ],
 [ 'nyislanders',  'nhl/islanders.png' ],
 [ 'nyrangers',    'nhl/rangers.png' ],
 [ 'philadelphia', 'nhl/flyers.png' ],
 [ 'pittsburgh',   'nhl/penguins.png' ],

 [ 'boston',   'nhl/bruins.png' ],
 [ 'buffalo',  'nhl/sabres.png' ],
 [ 'montreal', 'nhl/canadiens.png' ],
 [ 'ottawa',   'nhl/senators.png' ],
 [ 'toronto',  'nhl/mapleleafs.png' ],

 [ 'carolina',   'nhl/hurricanes.png' ],
 [ 'florida',    'nhl/panthers.png' ],
 [ 'tampabay',   'nhl/lightning.png' ],
 [ 'washington', 'nhl/capitals.png' ],
 [ 'winnipeg',   'nhl/jets.png' ],

 [ 'chicago',   'nhl/blackhawks.png' ],
 [ 'columbus',  'nhl/bluejackets.png' ],
 [ 'detroit',   'nhl/redwings.png' ],
 [ 'nashville', 'nhl/predators.png' ],
 [ 'stlouis',   'nhl/blues.png' ],

 [ 'calgary',    'nhl/flames.png' ],
 [ 'colorado',   'nhl/avalanche.png' ],
 [ 'edmonton',   'nhl/oilers.png' ],
 [ 'minnesota',  'nhl/wild.png' ],
 [ 'vancouver',  'nhl/canucks.png' ],

 [ 'anaheim',    'nhl/ducks.png' ],
 [ 'dallas',     'nhl/stars.png' ],
 [ 'losangeles', 'nhl/kings.png' ],
 [ 'phoenix',    'nhl/coyotes.png' ],
 [ 'sanjose',    'nhl/sharks.png' ]
]

Team.update_image_from_ary!( teams )

Prop.create!( :key => 'db.nhl.teams.2.version', :value => '1' )