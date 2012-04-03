class AddNhl < ActiveRecord::Migration
  def up
    
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


nhl403 = Round.create!( :event => nhl, :pos => 403, :title => '3.+4. April 2012' )
nhl405 = Round.create!( :event => nhl, :pos => 405, :title => '5.+6. April 2012' )
nhl407 = Round.create!( :event => nhl, :pos => 407, :title => '7. April 2012' )

games_nhl403 = [
  [  5, toronto,     nil, nil,  buffalo,      '2012-04-03 19:00' ],
  [  6, nyrangers,   nil, nil,  philadelphia, '2012-04-03 19:00' ],
  [  7, nyislanders, nil, nil,  newjersey,    '2012-04-03 19:00' ],
  [  8, pittsburgh,  nil, nil,  boston,       '2012-04-03 19:30' ],
  [  9, carolina,    nil, nil,  ottawa,       '2012-04-03 19:30' ],
  [ 10, winnipeg,    nil, nil,  florida,      '2012-04-03 20:00' ],
  [ 11, sanjose,     nil, nil,  dallas,       '2012-04-03 20:30' ],
  [ 12, anaheim,     nil, nil,  vancouver,    '2012-04-03 22:00' ],
  [ 13, columbus,    nil, nil,  phoenix,      '2012-04-03 22:00' ],
  [ 14, tampabay,    nil, nil, montreal,      '2012-04-04 19:30' ],
  [ 15, detroit,     nil, nil, stlouis,       '2012-04-04 19:30' ]
]

games_nhl405 = [
  [  1, nyrangers, nil, nil, pittsburgh,   '2012-04-05 19:00'],
  [  2, buffalo,   nil, nil, philadelphia, '2012-04-05 19:00'],
  [  3, winnipeg,  nil, nil, nyislanders,  '2012-04-05 19:00'],
  [  4, tampabay,  nil, nil, toronto,      '2012-04-05 19:00'],
  [  5, florida,   nil, nil, washington,   '2012-04-05 19:00'],
  [  6, montreal,  nil, nil, carolina,     '2012-04-05 19:00'],
  [  7, newjersey, nil, nil, detroit,      '2012-04-05 19:30'],
  [  8, boston,    nil, nil, ottawa,       '2012-04-05 19:30'],
  [  9, dallas,    nil, nil, nashville,    '2012-04-05 20:00'],
  [ 10, chicago,   nil, nil, minnesota,    '2012-04-05 20:00'],
  [ 11, columbus,  nil, nil, colorado,     '2012-04-05 21:00'],
  [ 12, vancouver, nil, nil, calgary,      '2012-04-05 21:00'],
  [ 13, anaheim,   nil, nil, edmonton,     '2012-04-05 21:30'],
  [ 14, sanjose,   nil, nil, losangeles,   '2012-04-05 22:30'],
  [ 15, phoenix,   nil, nil, stlouis,      '2012-04-06 20:30']
]

games_nhl407 = [
  [ 1, chicago,      nil, nil,  detroit,    '2012-04-07 13:00' ],
  [ 2, ottawa,       nil, nil,  newjersey,  '2012-04-07 15:00' ],
  [ 3, buffalo,      nil, nil,  boston,     '2012-04-07 16:00' ],
  [ 4, philadelphia, nil, nil,  pittsburgh, '2012-04-07 16:00' ],
  [ 5, anaheim,      nil, nil,  calgary,    '2012-04-07 16:00' ],
  [ 6, washington,   nil, nil,  nyrangers,  '2012-04-07 18:30' ],
  [ 7, toronto,      nil, nil,  montreal,   '2012-04-07 19:00' ],
  [ 8, nyislanders,  nil, nil,  columbus,   '2012-04-07 19:00' ],
  [ 9, tampabay,     nil, nil,  winnipeg,   '2012-04-07 19:00' ],
  [ 10, carolina,    nil, nil,  florida,    '2012-04-07 19:30' ],
  [ 11, phoenix,     nil, nil,  minnesota,  '2012-04-07 20:00' ],
  [ 12, stlouis,     nil, nil,  dallas,     '2012-04-07 20:00' ],
  [ 13, nashville,   nil, nil,  colorado,   '2012-04-07 21:00' ],
  [ 14, edmonton,    nil, nil,  vancouver,  '2012-04-07 22:00' ],
  [ 15, losangeles,  nil, nil,  sanjose,    '2012-04-07 22:30' ]
]

Game.create_from_ary!( games_nhl403, nhl403 )
Game.create_from_ary!( games_nhl405, nhl405 )
Game.create_from_ary!( games_nhl407, nhl407 )


# clemens = User.find_by_email!( 'clemens' )

# pool7 = Pool.create!( :event => nhl,  :title => 'UNIQA USS EF', :user => clemens, :welcome => '' )
# pool7.players << clemens # also add amin first
    
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
