# encoding: utf-8

### add viertelfinale games

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/euro2.rb"

esp = Team.find_by_key!( 'spain' )
ita = Team.find_by_key!( 'italy' )


games_euro2 = [
  [ 31, esp, [], ita, Time.cet('2012-07-01 20:45') ]]

euro  = Event.find_by_key!('euro')
euro2 = Round.find_by_event_id_and_pos_and_fix!( euro.id, 6, false )

Game.create_knockouts_from_ary!( games_euro2, euro2 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.2.version', :value => '1' )