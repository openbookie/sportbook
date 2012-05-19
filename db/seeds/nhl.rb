# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/nhl.rb"

######################################
## NHL  2012

nhl = Event.create!( :title => ' National Hockey League 2012', :key => 'nhl' )

newjersey    = Team.create!( :title => 'New Jersey Devils (East/Atlantic)',    :key => 'newjersey', :img => 'devils.png' )
nyislanders  = Team.create!( :title => 'New York Islanders (East/Atlantic)',   :key => 'nyislanders', :img => 'islanders.png' )
nyrangers    = Team.create!( :title => 'New York Rangers (East/Atlantic)',     :key => 'nyrangers', :img => 'rangers.png' )
philadelphia = Team.create!( :title => 'Philadelphia Flyers (East/Atlantic)',  :key => 'philadelphia', :img => 'flyers.png' )
pittsburgh   = Team.create!( :title => 'Pittsburgh Penguins (East/Atlantic)',  :key => 'pittsburgh', :img => 'penguins.png' )

boston       = Team.create!( :title => 'Boston Bruis (East/Northeast)',        :key => 'boston', :img => 'bruins.png' )
buffalo      = Team.create!( :title => 'Buffalo Sabres (East/Northeast)',      :key => 'buffalo', :img => 'sabres.png' )
montreal     = Team.create!( :title => 'Montreal Canadiens (East/Northeast)',  :key => 'montreal', :img => 'canadiens.png' )
ottawa       = Team.create!( :title => 'Ottawa Senators (East/Northeast)',     :key => 'ottawa', :img => 'senators.png' )
toronto      = Team.create!( :title => 'Toronto Maple Leafs (East/Northeast)', :key => 'toronto', :img => 'mapleleafs.png' )

carolina     = Team.create!( :title => 'Carolina Hurricanes (East/Southeast)', :key => 'carolina', :img => 'hurricanes.png' )
florida      = Team.create!( :title => 'Florida Panthers (East/Southeast)',    :key => 'florida', :img => 'panthers.png' )
tampabay     = Team.create!( :title => 'Tampa Bay Lightning (East/Southeast)', :key => 'tampabay', :img => 'lightning.png' )
washington   = Team.create!( :title => 'Washington Capitals (East/Southeast)', :key => 'washington', :img => 'capitals.png' )
winnipeg     = Team.create!( :title => 'Winnipeg Jets (East/Southeast)',       :key => 'winnipeg', :img => 'jets.png' )

chicago      = Team.create!( :title => 'Chicago Blackhawks (West/Central)',    :key => 'chicago', :img => 'blackhawks.png' )
columbus     = Team.create!( :title => 'Columbus Blue Jackets (West/Central)', :key => 'columbus', :img => 'bluejackets.png' )
detroit      = Team.create!( :title => 'Detroit Red Wings (West/Central)',     :key => 'detroit', :img => 'redwings.png' )
nashville    = Team.create!( :title => 'Nashville Predators (West/Central)',   :key => 'nashville', :img => 'predators.png' )
stlouis      = Team.create!( :title => 'St. Louis Blues (West/Central)',       :key => 'stlouis', :img => 'blues.png' )

calgary      = Team.create!( :title => 'Calgary Flames (West/Northwest)',      :key => 'calgary', :img => 'flames.png' )
colorado     = Team.create!( :title => 'Colorado Avalanche (West/Northwest)',  :key => 'colorado', :img => 'avalanche.png' )
edmonton     = Team.create!( :title => 'Edmonton Oilers (West/Northwest)',     :key => 'edmonton', :img => 'oilers.png' )
minnesota    = Team.create!( :title => 'Minnesota Wild (West/Northwest)',      :key => 'minnesota', :img => 'wild.png' )
vancouver    = Team.create!( :title => 'Vancouver Canucks (West/Northwest)',   :key => 'vancouver', :img => 'canucks.png' )

anaheim      = Team.create!( :title => 'Anaheim Ducks (West/Pacific)',         :key => 'anaheim', :img => 'ducks.png' )
dallas       = Team.create!( :title => 'Dallas Stars (West/Pacific)',          :key => 'dallas', :img => 'stars.png' )
losangeles   = Team.create!( :title => 'Los Angeles Kings (West/Pacific)',     :key => 'losangeles', :img => 'kings.png' )
phoenix      = Team.create!( :title => 'Phoenix Coyotes (West/Pacific)',       :key => 'phoenix', :img => 'coyotes.png' )
sanjose      = Team.create!( :title => 'San Jose Sharks (West/Pacific)',       :key => 'sanjose', :img => 'sharks.png' )


nhl.teams << anaheim
nhl.teams << boston 
nhl.teams << buffalo
nhl.teams << calgary
nhl.teams << carolina
nhl.teams << chicago
nhl.teams << colorado
nhl.teams << columbus
nhl.teams << dallas
nhl.teams << detroit
nhl.teams << edmonton
nhl.teams << florida
nhl.teams << losangeles
nhl.teams << minnesota
nhl.teams << montreal
nhl.teams << nashville
nhl.teams << newjersey
nhl.teams << nyislanders
nhl.teams << nyrangers
nhl.teams << ottawa
nhl.teams << philadelphia
nhl.teams << phoenix
nhl.teams << pittsburgh
nhl.teams << sanjose
nhl.teams << stlouis
nhl.teams << tampabay
nhl.teams << toronto
nhl.teams << vancouver
nhl.teams << washington
nhl.teams << winnipeg

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.nhl.version', :value => '1' )
