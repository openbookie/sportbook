# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/cl/el_2011_12.rb"

#################################
##  Europa League 2012

el = Event.create!( :key => 'el',
                    :title => 'Europa League 2011/12',
                    :team3 => false,
                    :start_at => Time.cet( '2011-10-10 17:00' ))

az       = Team.find_by_key!( 'az' )
valencia = Team.find_by_key!( 'valencia' )
schalke  = Team.find_by_key!( 'schalke' )
athletic = Team.find_by_key!( 'athletic' )
sporting = Team.find_by_key!( 'sporting' )
metalist = Team.find_by_key!( 'metalist' )
atletico = Team.find_by_key!( 'atletico' )
hannover = Team.find_by_key!( 'hannover' )

el.teams << az
el.teams << valencia
el.teams << schalke
el.teams << athletic
el.teams << sporting
el.teams << metalist
el.teams << atletico
el.teams << hannover

el8    = Round.create!( :event => el, :pos => 1, :title => 'Viertelfinale',            :title2 => '29. März 2012' )
el8_2  = Round.create!( :event => el, :pos => 2, :title => 'Viertelfinale Rückspiele', :title2 => '5. April 2012' )
el4    = Round.create!( :event => el, :pos => 3, :title => 'Halbfinale',               :title2 => '19. April 2012' )
el4_2  = Round.create!( :event => el, :pos => 4, :title => 'Halbfinale Rückspiele',    :title2 => '26. April 2012' )
el1    = Round.create!( :event => el, :pos => 5, :title => 'Finale',                   :title2 => '9. Mai 2012' )


games_el8 = [
  [[ 1, az,          [2, 1], valencia,   Time.cet('2012-03-29 21:05') ],
   [ 1, valencia,    [4, 0], az,         Time.cet('2012-04-05 21:05') ]],
  [[ 2, schalke,     [2, 4], athletic,   Time.cet('2012-03-29 21:05') ],
   [ 2, athletic,    [2, 2], schalke,    Time.cet('2012-04-05 21:05') ]],
  [[ 3, sporting,    [2, 1], metalist,   Time.cet('2012-03-29 21:05') ],
   [ 3, metalist,    [1, 1], sporting,   Time.cet('2012-04-05 21:05') ]],
  [[ 4, atletico,    [2, 1], hannover,   Time.cet('2012-03-29 21:05') ],
   [ 4, hannover,    [1, 2], atletico,   Time.cet('2012-04-05 21:05') ]]
]

games_el4 = [
  [[ 1, atletico,    [4, 2], valencia,   Time.cet('2012-04-19 21:05') ],
   [ 1, valencia,    [0, 1], atletico,   Time.cet('2012-04-26 21:05') ]],
  [[ 2, sporting,    [2, 1], athletic,   Time.cet('2012-04-19 21:05') ],
   [ 2, athletic,    [3, 1], sporting,   Time.cet('2012-04-26 21:05') ]]
]

games_el1 = [
  [ 1, atletico,     [3, 0], athletic,   Time.cet('2012-05-09 20:45') ]]


Game.create_knockout_pairs_from_ary!( games_el8, el8, el8_2 )
Game.create_knockout_pairs_from_ary!( games_el4, el4, el4_2 )
Game.create_knockouts_from_ary!( games_el1,  el1 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.el.2011/12.version', :value => '1' )