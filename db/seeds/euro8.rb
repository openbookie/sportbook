# encoding: utf-8

### add viertelfinale games

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/euro8.rb"


gre = Team.find_by_key!( 'greece' )
cze = Team.find_by_key!( 'czech' )
ger = Team.find_by_key!( 'germany' )
por = Team.find_by_key!( 'portugal' )
esp = Team.find_by_key!( 'spain' )
ita = Team.find_by_key!( 'italy' )
fra = Team.find_by_key!( 'france' )
eng = Team.find_by_key!( 'england' )


games_euro8 = [
  [ 25, cze, [], por, Time.cet('2012-06-21 20:45') ],
  [ 26, ger, [], gre, Time.cet('2012-06-22 20:45') ],
  [ 27, esp, [], fra, Time.cet('2012-06-23 20:45') ],
  [ 28, eng, [], ita, Time.cet('2012-06-24 20:45') ]]

euro  = Event.find_by_key!( 'euro')
euro8 = Round.find_by_event_id_and_pos_and_fix!( euro.id, 4, false )

Game.create_knockouts_from_ary!( games_euro8, euro8 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.8.version', :value => '1' )