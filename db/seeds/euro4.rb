# encoding: utf-8

### add viertelfinale games

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/euro4.rb"

por = Team.find_by_key!( 'portugal' )
esp = Team.find_by_key!( 'spain' )
ger = Team.find_by_key!( 'germany' )
ita = Team.find_by_key!( 'italy' )


games_euro4 = [
  [ 29, por, [], esp, Time.cet('2012-06-27 20:45') ],
  [ 30, ger, [], ita, Time.cet('2012-06-28 20:45') ]]

euro  = Event.find_by_key!('euro')
euro4 = Round.find_by_event_id_and_pos_and_fix!( euro.id, 5, false )

Game.create_knockouts_from_ary!( games_euro4, euro4 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.4.version', :value => '1' )